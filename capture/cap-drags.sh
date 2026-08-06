#!/bin/zsh
# The four shots that have to be taken with the mouse button still down.
source "$(dirname "$0")/lib.sh"

mode="${1:-light}"
HELD="$OUT/_held-$mode.png"
cut() { crop_from "$HELD" "$1" "$mode" "$2" >/dev/null; echo "  $1"; }

# ---- a tab held over the lower half of its pane ---------------------
reset_book
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -timeline.zoom 0.25
"$SCRATCH/mouse" dblclick $((WIN_X + 330)) $((WIN_Y + 286))
sleep 1
click_at 78 484
sleep 2.5
hold_shot 520 67 980 800 "$HELD"
cut editor-tab-drag '1045x520+462+400'

# ---- a character row held over the editor text ----------------------
reset_book
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -autoSection characters
sleep 1
hold_shot 330 200 900 300 "$HELD"
cut editor-drag-reference '1045x340+462+120'

# ---- a chapter row held on another row's edge (reorder) -------------
reset_book
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
sleep 1
hold_shot 340 286 340 116 "$HELD"
cut manuscript-reorder '240x330+220+60'

echo "--- held-drag shots done ($mode)"
