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
OUT="$SCRATCH/shots"

# The throwaway book lives inside the app's **sandbox container**, not
# in $SCRATCH.
#
# The app is sandboxed, so it can only reach folders the user has
# granted it — normally by picking them in an open panel. `-autoOpenPath`
# hands it a bare path with no grant behind it, so a book anywhere else
# simply fails to open and the automation photographs the welcome
# screen instead: no error, no crash, just the wrong picture. A folder
# inside the container needs no grant at all.
#
# (`$SCRATCH` still holds the build, the helper binaries and the
# output — none of which the sandboxed app has to read.)
CONTAINER="$HOME/Library/Containers/de.esperester.writingale/Data"
BOOK="${WG_BOOK:-$CONTAINER/example-book}"

# The window every geometry in these scripts is measured against.
# WIN_X/WIN_Y assume a display at least 2488x1217 points with the app
# placed clear of the menu bar; on a smaller one the window is clamped
# and every crop below is off. Check the first capture before trusting
# a whole run.
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
# The container belongs to macOS, not to us: `containermanagerd` creates
# it — metadata plist and all — the first time the app runs. Making
# `Data/` by hand produces a directory that looks right and may be
# relocated or replaced on that first launch, stranding the book we just
# copied into it. So on a clean machine, let the app create its own
# container and wait for it.
ensure_container() {
  [[ -d "$CONTAINER" ]] && return 0
  echo "no container yet — launching once so macOS creates it" >&2
  open -n "$APP" >/dev/null 2>&1
  local n=0
  while [[ ! -d "$CONTAINER" ]] && (( n < 60 )); do sleep 0.5; ((n++)); done
  quit_app
  [[ -d "$CONTAINER" ]] || { echo "container never appeared at $CONTAINER" >&2; return 1; }
}

reset_book() {
  # Only meaningful for the default location; WG_BOOK is the caller's
  # problem (and see README — pointing it outside the container breaks
  # every shot).
  [[ "$BOOK" == "$CONTAINER"/* ]] && { ensure_container || return 1; }
  mkdir -p "${BOOK:h}"
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
  # The site is written in en-US. Without this the app formats numbers
  # and dates in the developer's own locale, and a screenshot reading
  # "60.000 words" or "15,5 pt" contradicts the prose beside it.
  -AppleLocale en_US
  -AppleLanguages '("en-US")'
)

# Fails if the window is not key: an unfocused window drains its accent
# highlights to grey (by design — see DESIGN.md), so a capture taken
# while something else has focus is subtly and silently wrong.
# Checks the close button, which is red only when the window is key.
assert_focused() {
  local info id tmp red
  info="$("$SCRATCH/windowid" Writingale)" || return 1
  id="${info%% *}"
  tmp="$(mktemp -t wgfocus).png"
  screencapture -x -o -l "$id" "$tmp"
  red="$(magick "$tmp" -crop '1x1+26+26' +repage -format '%[fx:int(255*r)] %[fx:int(255*g)]' info:)"
  rm -f "$tmp"
  local r="${red%% *}" g="${red##* }"
  if (( r < 180 || g > 160 )); then
    echo "WARNING: window is not key (close button is $red) — capture may be wrong" >&2
    return 1
  fi
}

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
  assert_focused || true   # warn, don't abort: some shots are checked by eye
  # Only when this launch was supposed to open a book.
  if [[ "$*" == *-autoOpenPath* ]]; then
    assert_book_open || true
  fi
}

# Fails if the app is sitting on the welcome screen when a book was
# asked for. Under the sandbox that is the *normal* way `-autoOpenPath`
# fails — the app has no grant for the path, so it opens nothing, shows
# no error, and every shot in the pass is silently of the wrong window.
# The window title is the tell: the welcome window is "Writingale", an
# open book's is its title.
assert_book_open() {
  local name
  name="$(osascript -e 'tell application "System Events" to tell process "Writingale" to get name of window 1' 2>/dev/null)"
  if [[ -z "$name" || "$name" == "Writingale" ]]; then
    echo "WARNING: no book open (window is \"${name:-none}\") — is the book inside the sandbox container? See README." >&2
    return 1
  fi
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
