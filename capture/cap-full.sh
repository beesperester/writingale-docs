#!/bin/zsh
# Full-window compositions: the shots that introduce a whole view.
source "$(dirname "$0")/lib.sh"

mode="$1"

reset_book

# welcome — no automation args; the recents list is the developer's own.
launch "$mode"
shot welcome "$mode"

# editor — a chapter open in a single pane.
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
shot editor "$mode"

# character — an entity with the inspector open.
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Narrator" -autoInspector YES
shot character "$mode"

# journey — the same, scrolled to the inspector's Journey section.
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Narrator" -autoInspector YES
scroll_ticks -30 1360 500
shot journey "$mode"

# graph — settled, then panned onto Book Two's stretch of the spine.
# At 28 chapters the map is several pane-widths wide at 1:1, and its
# zoom is a pinch (no preference, no key), so the shot is a pan to a
# legible stretch rather than the whole map.
launch "$mode" -autoOpenPath "$BOOK" -autoSection graph
sleep 8
"$SCRATCH/mouse" drag $((WIN_X + 1300)) $((WIN_Y + 750)) $((WIN_X + 640)) $((WIN_Y + 860))
sleep 2
shot graph "$mode"

# timeline — the proportional board, zoomed out far enough that the
# whole invasion, the two-year epilogue and the scale break between
# them are all on the board at once.
launch "$mode" -autoOpenPath "$BOOK" -autoSection timeline -timeline.zoom 0.25
sleep 3
"$SCRATCH/mouse" hscroll $((WIN_X + 1000)) $((WIN_Y + 500)) -14
sleep 1
"$SCRATCH/mouse" scroll $((WIN_X + 1000)) $((WIN_Y + 450)) -5
sleep 1
shot timeline "$mode"

# editor-manuscript — the continuous column.
launch "$mode" -autoOpenPath "$BOOK" -autoContinuous YES
sleep 2
scroll_ticks -18 1000 500
shot editor-manuscript "$mode"

# editor-split — a chapter above a timeline tab, each pane with its own
# tab strip: ⌘⌥↓ splits down, then Views → Timeline opens in the new
# (focused) pane.
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -timeline.zoom 0.25
key_code 125 "command down, option down"
sleep 1
click_at 78 484
sleep 3
"$SCRATCH/mouse" hscroll $((WIN_X + 1000)) $((WIN_Y + 720)) -14
sleep 1.5
shot editor-split "$mode"

# editor-hidden — distraction-free. Set by argument rather than by ⌘.:
# the baseline pins the preference, and an argument-domain value can't
# be toggled from inside the app.
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -editor.interfaceHidden YES
shot editor-hidden "$mode"

echo "--- full-window pass done ($mode)"
