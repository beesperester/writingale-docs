#!/bin/zsh
# Shots that need the app driven: menus, popovers, held drags, typing.
source "$(dirname "$0")/lib.sh"

mode="${1:-light}"
TMP="$OUT/_src-$mode.png"
cut() { crop_from "$TMP" "$1" "$mode" "$2" >/dev/null; echo "  $1"; }
type_text() { osascript -e "tell application \"System Events\" to keystroke \"$1\"" >/dev/null 2>&1; sleep 1; }
press_return() { osascript -e 'tell application "System Events" to key code 36' >/dev/null 2>&1; sleep 1.5; }

# ---- inspector-storytime, from the note that sits before page one ----
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The gas jets on Mars" -autoInspector YES
capture_window "$TMP"
cut inspector-storytime '297x212+1215+306'

# ---- Settings → Editor (its own window, smaller than the main one) ---
launch "$mode" -autoOpenPath "$BOOK" -editor.wrapColumnEnabled YES
key "," "command down"
sleep 2
sid="$("$SCRATCH/windowid" Writingale --smallest)"
screencapture -x -o -l "${sid%% *}" "$OUT/_settings-$mode.png"
magick "$OUT/_settings-$mode.png" -crop '440x412+0+90' +repage "$OUT/settings-editor-$mode.png"
echo "  settings-editor"

# ---- the view search bar, on the timeline --------------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSection timeline -timeline.zoom 0.25
sleep 3
"$SCRATCH/mouse" hscroll $((WIN_X + 1000)) $((WIN_Y + 500)) -14
sleep 1
key "f" "command down"
type_text "storm"
press_return
capture_window "$TMP"
cut view-search '1045x570+462+88'

# ---- quick insert ----------------------------------------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
key "k" "command down"
type_text "arti"
sleep 1
capture_window "$TMP"
cut quick-insert '600x320+456+120'

# ---- the goal popover, Goal then History ----------------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
click_at 194 70
sleep 1.5
capture_region $((WIN_X + 85)) $((WIN_Y + 88)) 245 275 "$OUT/goal-popover-$mode.png"
echo "  goal-popover"
click_at 235 129          # the History tab inside the popover
sleep 1.5
capture_region $((WIN_X + 85)) $((WIN_Y + 88)) 245 275 "$OUT/goal-history-$mode.png"
echo "  goal-history"

# ---- Split Here, from the editor's context menu ----------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
"$SCRATCH/mouse" rightclick $((WIN_X + 900)) $((WIN_Y + 430))
sleep 1.5
capture_region $((WIN_X + 880)) $((WIN_Y + 410)) 400 220 "$OUT/split-here-$mode.png"
echo "  split-here"
osascript -e 'tell application "System Events" to key code 53' >/dev/null 2>&1

# ---- Annotate, from a selection's context menu -----------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
"$SCRATCH/mouse" drag $((WIN_X + 665)) $((WIN_Y + 247)) $((WIN_X + 860)) $((WIN_Y + 247))
sleep 1
"$SCRATCH/mouse" rightclick $((WIN_X + 760)) $((WIN_Y + 247))
sleep 1.5
capture_region $((WIN_X + 740)) $((WIN_Y + 227)) 420 300 "$OUT/annotate-menu-$mode.png"
echo "  annotate-menu"
osascript -e 'tell application "System Events" to key code 53' >/dev/null 2>&1

# ---- tabs: a pinned chapter, a timeline tab, a provisional tab -------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
"$SCRATCH/mouse" dblclick $((WIN_X + 330)) $((WIN_Y + 286))   # pin the chapter
sleep 1
click_at 78 484                                                # Views → Timeline
sleep 2
click_at 330 371                                               # one click = provisional
sleep 1.5
capture_window "$TMP"
cut editor-tabs '620x36+462+52'

# ---- a tab held over the lower quarter of its pane -------------------
"$SCRATCH/mouse" holddrag $((WIN_X + 520)) $((WIN_Y + 67)) $((WIN_X + 980)) $((WIN_Y + 830))
sleep 1
capture_window "$TMP"
cut editor-tab-drag '1045x500+462+400'
"$SCRATCH/mouse" release $((WIN_X + 980)) $((WIN_Y + 830))
sleep 1


# ---- the board drilled into a part, with its breadcrumb --------------
launch "$mode" -autoOpenPath "$BOOK" -autoSection timeline -timeline.zoom 0.25
sleep 3
"$SCRATCH/mouse" hscroll $((WIN_X + 1000)) $((WIN_Y + 500)) -14
sleep 1
"$SCRATCH/mouse" dblclick $((WIN_X + 700)) $((WIN_Y + 182))
sleep 3
capture_window "$TMP"
cut timeline-breadcrumb '1045x420+462+88'

echo "--- interaction shots done ($mode)"
