#!/bin/zsh
# Cropped close-ups. Each block sets up one source composition, captures
# the window once, and lifts every crop that composition can supply.
source "$(dirname "$0")/lib.sh"

mode="${1:-light}"
TMP="$OUT/_src-$mode.png"

# grab <entity> [extra args...] — inspector composition, window captured
grab() {
  local name="$1"; shift
  launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "$name" -autoInspector YES "$@"
}

cut() { crop_from "$TMP" "$1" "$mode" "$2" >/dev/null; echo "  $1"; }

# ---- inspector: one chapter carries overview → story time -----------
grab "The Days of Imprisonment" -autoSelectType chapters
capture_window "$TMP"
cut inspector-overview   '297x88+1215+52'
cut inspector-identity   '297x182+1215+138'
cut inspector-completion '297x64+1215+315'
cut inspector-goal       '297x196+1215+378'
cut inspector-storytime  '297x218+1215+572'

# ---- inspector: a part, scrolled to nesting/progress/contents -------
grab "Book One — The Coming of the Martians"
"$SCRATCH/mouse" scroll $((WIN_X + 1360)) $((WIN_Y + 500)) -8; sleep 1
capture_window "$TMP"
cut inspector-nesting '297x395+1215+508'

# ---- inspector: a note that annotates two chapters ------------------
grab "Why the Martians fail"
"$SCRATCH/mouse" scroll $((WIN_X + 1360)) $((WIN_Y + 500)) -8; sleep 1
capture_window "$TMP"
cut inspector-annotates   '297x145+1215+403'
cut inspector-referencedby '297x255+1215+678'

# ---- inspector: a chapter carrying an attached note -----------------
grab "Dead London" -autoSelectType chapters
"$SCRATCH/mouse" scroll $((WIN_X + 1360)) $((WIN_Y + 500)) -8; sleep 1
capture_window "$TMP"
cut inspector-notes '297x140+1215+713'

# ---- inspector: relationships --------------------------------------
grab "The Narrator"
capture_window "$TMP"
cut inspector-relationships '297x240+1215+286'

# ---- inspector: the journey list, at the bottom ---------------------
grab "The Narrator"
"$SCRATCH/mouse" scroll $((WIN_X + 1360)) $((WIN_Y + 500)) -52; sleep 1.5
capture_window "$TMP"
cut inspector-journey '297x480+1215+455'
cp "$TMP" "$OUT/journey-$mode.png"     # the full-window twin

# ---- inspector: custom fields, single-value and list ----------------
grab "The New Order"
capture_window "$TMP"
cut inspector-fields-single '297x140+1215+483'
cut inspector-fields-multi  '297x275+1215+626'

# ---- inspector: an image entity ------------------------------------
grab "Cover"
capture_window "$TMP"
cut inspector-image '297x462+1215+286'

# ---- editor: the three markdown views -------------------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -editor.markdownMode raw
capture_window "$TMP"
cut editor-raw '1000x560+500+88'

launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -editor.markdownMode preview
capture_window "$TMP"
cut editor-preview '1000x560+500+88'

# ---- editor: sentence focus, caret placed in a sentence -------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -editor.focusHighlight sentence
click_at 900 450
sleep 1
capture_window "$TMP"
cut editor-focus '1000x560+500+88'

# ---- toolbar close-ups ----------------------------------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters
capture_window "$TMP"
cut editor-format-buttons '220x44+688+4'
cut editor-split-buttons  '120x44+930+4'
cut editor-view-switcher  '116x44+1074+4'

# ---- editor: the line-number gutter ---------------------------------
cut editor-line-numbers '560x230+462+88'

# ---- sheets ----------------------------------------------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSelectName "The Heat-Ray" -autoSelectType chapters \
  -autoSheet export
sleep 1.5
capture_window "$TMP"
cut export-sheet '800x600+360+180'

# Scrolled to the foot of the form: the row order and the writing goal
# are both below the fold, and both are what the docs point here for.
launch "$mode" -autoOpenPath "$BOOK" -autoSheet settings
sleep 1.5
"$SCRATCH/mouse" scroll $((WIN_X + 760)) $((WIN_Y + 500)) -10
sleep 1
capture_window "$TMP"
cut book-settings '470x530+525+210'

launch "$mode" -autoOpenPath "$BOOK" -autoSheet types
sleep 1.5
capture_window "$TMP"
cut type-editor '800x600+360+180'

# ---- graph controls --------------------------------------------------
launch "$mode" -autoOpenPath "$BOOK" -autoSection graph
sleep 6
capture_window "$TMP"
cut graph-controls '530x58+470+88'

# ---- timeline header: type filter, ordering, summary, zoom -----------
launch "$mode" -autoOpenPath "$BOOK" -autoSection timeline -timeline.zoom 0.25
sleep 3
capture_window "$TMP"
cut timeline-controls '1045x50+462+88'

echo "--- crops done ($mode)"
