#!/bin/zsh
# Shared capture mechanics for the Writingale documentation screenshots.
# See ../CLAUDE.md § Screenshots for what this is and how to run it.
set -uo pipefail

HERE="${0:A:h}"
DOCS="${HERE:h}"
REPO="${DOCS:h}"

# Working directory for the built app, the helper binaries and the
# output. Override with WG_SCRATCH to keep it off the boot volume.
SCRATCH="${WG_SCRATCH:-/tmp/writingale-capture}"
# The app under test. Build it first:
#   xcodebuild -project app/App/Writingale.xcodeproj -scheme Writingale \
#     -derivedDataPath "$SCRATCH/dd" build
APP="${WG_APP:-$SCRATCH/dd/Build/Products/Debug/Writingale.app}"
BOOK="$SCRATCH/example-book"
OUT="$SCRATCH/shots"

# The window every geometry in these scripts is measured against.
WIN_W=1512
WIN_H=949
WIN_X=976
WIN_Y=268

mkdir -p "$OUT"

# The two helper binaries are built from source on first use.
for tool in windowid mouse; do
  if [[ ! -x "$SCRATCH/$tool" || "$HERE/$tool.swift" -nt "$SCRATCH/$tool" ]]; then
    swiftc -O "$HERE/$tool.swift" -o "$SCRATCH/$tool" || exit 1
  fi
done

# A pristine copy of the example book, so captures never dirty the repo.
reset_book() {
  rm -rf "$BOOK"
  cp -R "$REPO/app/ExampleBook" "$BOOK"
  rm -rf "$BOOK/.writingale"
  seed_stats
}

# The goal popover's History tab reads .writingale/stats.json, which a
# fresh copy has none of — without this the tab photographs as a column
# of zeros. Eight days ending today, so "this week" and "daily best"
# both have something to say.
seed_stats() {
  mkdir -p "$BOOK/.writingale"
  python3 - "$BOOK/.writingale/stats.json" <<'PYEOF'
import json, sys, datetime
counts = [1180, 640, 0, 2310, 1475, 890, 1620, 430]
today = datetime.date.today()
days = [
    {"date": (today - datetime.timedelta(days=i)).isoformat(), "wordsAdded": n}
    for i, n in enumerate(reversed(counts)) if n
]
days.sort(key=lambda d: d["date"])
open(sys.argv[1], "w").write(json.dumps({"days": days}, indent=2))
PYEOF
}

quit_app() {
  osascript -e 'tell application "Writingale" to quit' >/dev/null 2>&1
  local n=0
  while pgrep -x Writingale >/dev/null && (( n < 30 )); do sleep 0.2; ((n++)); done
  pkill -x Writingale >/dev/null 2>&1
  sleep 0.4
}

# Every preference the shots depend on, pinned to its shipped default so
# a capture never inherits whatever the developer last set by hand.
BASELINE=(
  -editor.focusHighlight off
  -editor.typewriterMode off
  -editor.interfaceHidden NO
  -editor.fontFamily ""
  -editor.fontSize 15.5
  -editor.lineHeight 1.25
  -editor.wrapColumnEnabled NO
  -editor.wrapColumn 80
  -timeline.abbreviateGaps YES
  -timeline.gapThreshold 15
  -timeline.zoom 1
)

# launch <light|dark> [extra args...]
launch() {
  local mode="$1"; shift
  quit_app
  local -a appearance
  if [[ "$mode" == dark ]]; then
    appearance=(-AppleInterfaceStyle Dark)
  else
    appearance=(-AppleInterfaceStyle Light -NSRequiresAquaSystemAppearance YES)
  fi
  # The workspace (open tabs, splits) is persisted into the book, so a
  # launch would otherwise inherit the previous shot's panes.
  rm -rf "$BOOK/.writingale/workspace.json"
  open -n "$APP" --args "${appearance[@]}" "${BASELINE[@]}" "$@"
  # Wait for the window to exist.
  local n=0
  while ! "$SCRATCH/windowid" Writingale >/dev/null 2>&1 && (( n < 100 )); do sleep 0.2; ((n++)); done
  sleep 1.2
  normalize_window
  sleep 0.8
}

normalize_window() {
  osascript <<EOF >/dev/null 2>&1
tell application "System Events" to tell process "Writingale"
  set frontmost to true
  try
    set position of window 1 to {$WIN_X, $WIN_Y}
    set size of window 1 to {$WIN_W, $WIN_H}
  end try
end tell
EOF
}

# capture_window <output-path>  — per-window capture (transparent corners)
capture_window() {
  local dest="$1"
  local info
  info="$("$SCRATCH/windowid" Writingale)" || { echo "no window" >&2; return 1; }
  local id="${info%% *}"
  screencapture -x -o -l "$id" "$dest" || return 1
}

# capture_region <x> <y> <w> <h> <output-path> — screen-coordinate region
capture_region() {
  screencapture -x -R "$1,$2,$3,$4" "$5"
}

# shot <name> <mode> — full-window capture into shots/<name>-<mode>.png
shot() {
  capture_window "$OUT/$1-$2.png"
  magick identify "$OUT/$1-$2.png"
}

# crop <name> <mode> <WxH+X+Y>  — crop the last full-window capture
crop_from() {
  local src="$1" name="$2" mode="$3" geom="$4"
  magick "$src" -crop "$geom" +repage "$OUT/$name-$mode.png"
  magick identify "$OUT/$name-$mode.png"
}

# key <key> <modifier list>  e.g. key "." "command down"
key() {
  osascript -e "tell application \"System Events\" to keystroke \"$1\" using {$2}" >/dev/null 2>&1
  sleep 0.6
}

# key_code <code> <modifier list>  e.g. key_code 125 "command down, option down"
key_code() {
  osascript -e "tell application \"System Events\" to key code $1 using {$2}" >/dev/null 2>&1
  sleep 0.8
}

# menu_item <menu> <item...>  — walks the app's own menu bar
menu_item() {
  local menu="$1"; shift
  local path=""
  for it in "$@"; do path="$path of menu item \"$it\""; done
  osascript <<EOF >/dev/null 2>&1
tell application "System Events" to tell process "Writingale"
  set frontmost to true
  click menu item "$1" of menu "$menu" of menu bar 1
end tell
EOF
  sleep 0.7
}

# scroll_ticks <n> <x> <y> — window-relative scroll at a point
scroll_ticks() {
  local n="$1" x=$((WIN_X + $2)) y=$((WIN_Y + $3))
  "$SCRATCH/mouse" scroll "$x" "$y" "$n"
  sleep 0.8
}

# click_at <x> <y> — window-relative click
click_at() {
  "$SCRATCH/mouse" click $((WIN_X + $1)) $((WIN_Y + $2))
  sleep 0.6
}

# hold_shot <x1> <y1> <x2> <y2> <dest> — window-relative held drag,
# captured while the pointer is still down.
#
# Two things this has to work around. A per-window capture
# (`screencapture -l`) comes back blank during an AppKit drag session,
# so the whole screen is captured and the window cropped out of it. And
# the drag has to still be *gliding* when the shutter goes: the drop
# indicators are drawn in response to the drag entering a target, so the
# glide runs in the background and the capture happens partway through.
hold_shot() {
  local x1=$((WIN_X + $1)) y1=$((WIN_Y + $2)) x2=$((WIN_X + $3)) y2=$((WIN_Y + $4)) dest="$5"
  local full="$SCRATCH/shots/_full.png"
  ("$SCRATCH/mouse" holddrag "$x1" "$y1" "$x2" "$y2" &)
  sleep 1.2
  screencapture -x "$full"
  sleep 0.6
  "$SCRATCH/mouse" release "$x2" "$y2"
  sleep 0.8
  magick "$full" -crop "${WIN_W}x${WIN_H}+${WIN_X}+${WIN_Y}" +repage "$dest"
}

# Confirms the window is key by sampling the close button's red.
focused() {
  local info id tmp
  info="$("$SCRATCH/windowid" Writingale)" || return 1
  id="${info%% *}"
  tmp="$(mktemp -t wgfocus).png"
  screencapture -x -o -l "$id" "$tmp"
  magick "$tmp" -crop '1x1+26+26' +repage -format '%[pixel:p{0,0}]' info:
  rm -f "$tmp"
}
