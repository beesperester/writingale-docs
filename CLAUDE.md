# docs/ — notes for Claude

This is the Writingale user-facing documentation site (VitePress). See
the repo root [`CLAUDE.md`](../CLAUDE.md) for the doc-sync rule and the
brand-asset conventions; see [`app/CLAUDE.md`](../app/CLAUDE.md) for the
app itself.

## Audience — write for book-writers, not programmers

The documentation is for people who want to **write a book**, not for
developers. They come from many backgrounds — novelists, worldbuilders,
students — but not from programming. They read the docs to get a task
done ("how do I keep track of who knows whom?"), not to learn a system.
Concretely:

- **Task-first framing.** Lead with what the user wants to accomplish
  and the interaction that accomplishes it (click this, drag that),
  not with the data model behind it.
- **Plain language in `guide/`.** Avoid programmer jargon: no
  "frontmatter", "YAML", "uid", "schema", "cardinality" in guide
  prose. When the on-disk format genuinely matters to the guide (it
  rarely does), link to the [file format reference](reference/file-format.md)
  instead of inlining it. `reference/` is where the technical detail
  lives, and technical language is fine there.
- **Visuals for every interaction.** Every relevant interaction a new,
  non-technical user has with the app should be documented and
  supported by a screenshot — cropped close-ups of the specific
  control being discussed, not full-window shots the reader has to
  scan. (Full-window shots are still right for introducing a whole
  view, e.g. the graph or the welcome screen.)

## Screenshots

Screenshots live in `docs/public/screenshots/` as light/dark pairs
(`<name>-light.png` / `<name>-dark.png`).

**The `docs-screenshots` capture skill was deliberately removed
(2026-07-31)** — its full-window-only compositions no longer fit the
requirements below. When recreating it, build these requirements in
rather than porting the old script as-is. Capture mechanics that still
apply: build with a fresh `-derivedDataPath`, launch against a /tmp
copy of `app/ExampleBook` with the automation args (`-autoOpenPath`,
`-autoSelectName`, `-autoInspector YES`, `-autoSection` — `graph`,
`timeline`, or an entity section by plural name like `characters`,
which combined with `-autoSelectName` gives "document open, different
list shown" for the drag-to-reference shot,
`-autoSheet export|settings|types` — the last opens the export sheet,
the book settings sheet, or its Entity Types tab directly;
`-autoContinuous YES` opens the continuous-scroll layout), force
appearance per shot (`-NSRequiresAquaSystemAppearance YES` /
`-AppleInterfaceStyle Dark`), normalize the window to 1512×949 pt,
capture per-window with `screencapture -l`, and verify focus by
checking the traffic-light pixel color. The terminal needs Screen
Recording + Accessibility permissions.

### Screenshot requirements

- **Cropped close-ups, not full-window shots**, for any section- or
  control-level documentation: the inspector's sections, the goal
  popover, writing modes, and any other specific interaction. Crop to
  the column/control under discussion (the inspector column is the
  right ~290 pt of the window; crop bands vertically per section).
- Full-window shots remain right for whole-view introductions
  (welcome, editor, graph, timeline).
- Every relevant interaction a new non-technical user has with the
  app should have a visual: writing modes (line/sentence/paragraph
  focus, raw markdown), the split editor, the book-goal popover (Goal
  and History tabs), annotating from a selection, creating entities,
  and the inspector's per-section controls.

### Currently captured

All from the bundled example book, *The War of the Worlds* — Wells's
complete novel, 27 chapters across two books — at a 1512×949 window. **Every checked-in screenshot predates the
2026-08-04 example-book rebuild and therefore shows the retired
*Machine Stops* material — all of them need recapturing; the
compositions below are already written for the new book.** **Full-window** shots introduce whole views; everything else is
a **crop** of a full-window capture (crop geometries in points,
`WxH+X+Y`, window origin top-left; the inspector column is
`297x…+1215+…`).

Full-window:

| name | composition | used on |
|---|---|---|
| `welcome` | Welcome screen, no automation args | [what-is-writingale.md](guide/what-is-writingale.md), [quick-start.md](guide/quick-start.md) |
| `editor` | "The Heat-Ray" open | [editor.md](guide/editor.md), [quick-start.md](guide/quick-start.md) |
| `editor-split` | "The Heat-Ray" above a timeline tab, each pane with its own tab strip (⌘⌥↓, then Views → Timeline in the new pane) | [editor.md](guide/editor.md) |
| `editor-hidden` | "The Heat-Ray", Hide Interface toggled (⌘. via System Events keystroke) | [editor.md](guide/editor.md) |
| `character` | "The Narrator" with inspector open | [concepts.md](guide/concepts.md) |
| `journey` | "The Narrator" with inspector open, scrolled to bottom (30 ticks) | [journeys.md](guide/journeys.md) |
| `graph` | Graph view, settled layout | [graph.md](guide/graph.md) |
| `timeline` | Timeline view (hour-based spacing — 27 chapters across hours 0–900 on two rows, the observatory span at −1,440…−1,200, the epilogue at 17,520) | [timeline.md](guide/timeline.md) |

**`timeline` is stale as of 2026-08-04** — Story Order was rebuilt on a
proportional axis (cards positioned and sized by time, a numbered
ruler with scale-break marks, a trailing *Unscheduled* strip) and
Manuscript Order is now an evenly numbered strip. Recapture both.

**`graph-controls` is stale as of 2026-08-04** — the graph's and the
timeline's own share buttons are gone; exporting either is now the one
context-aware Export button in the window toolbar. Recapture the
control row without it.

Crops (source composition → crop):

| name | source + crop | used on |
|---|---|---|
| `inspector-overview` | "The Days of Imprisonment" + inspector, top → `297x70+1215+62` | [inspector.md](guide/inspector.md) |
| `inspector-identity` | same → `297x175+1215+135` | [inspector.md](guide/inspector.md) |
| `inspector-completion` | same → `297x70+1215+312` | [inspector.md](guide/inspector.md) |
| `inspector-goal` | "The Days of Imprisonment" + inspector (goal 6,000); "Text and rights (not part of the book)" for the material flag → `297x200+1215+362` | [inspector.md](guide/inspector.md), [goals.md](guide/goals.md) |
| `inspector-storytime` | "The gas jets on Mars" + inspector (From −1,440, To −1,200 hours) → `297x225+1215+300` | [inspector.md](guide/inspector.md) |
| `inspector-image` | "Cover" + inspector → `297x430+1215+285` | [inspector.md](guide/inspector.md) |
| `inspector-relationships` | "The Narrator" + inspector → `297x155+1215+285` | [inspector.md](guide/inspector.md) |
| `inspector-nesting` | "Book One — The Coming of the Martians" + inspector, scrolled 8 ticks → `297x407+1215+128` | [inspector.md](guide/inspector.md) |
| `inspector-annotates` | "Note on the epigraph" + inspector → `297x110+1215+515` | [inspector.md](guide/inspector.md) |
| `inspector-notes` | "Dead London" + inspector, scrolled 14 ticks → `297x132+1215+228` | [inspector.md](guide/inspector.md) |
| `inspector-fields-single` | "The New Order" + inspector → `297x130+1215+485` | [inspector.md](guide/inspector.md) |
| `inspector-fields-multi` | "The Days of Imprisonment" + inspector, scrolled 14 ticks → `297x350+1215+330` | [inspector.md](guide/inspector.md) |
| `inspector-referencedby` | same → `297x240+1215+695` | [inspector.md](guide/inspector.md) |
| `inspector-journey` | "The Narrator" + inspector, scrolled to bottom → `297x610+1215+325` | [inspector.md](guide/inspector.md) |
| `editor-focus` | "The Heat-Ray", `-editor.focusHighlight sentence`, caret clicked into the last paragraph's second sentence → `1000x580+500+55` | [editor.md](guide/editor.md) |
| `editor-raw` | "The Heat-Ray", `-editor.markdownMode raw` → `1000x580+500+55` | [editor.md](guide/editor.md) |
| `editor-preview` | "The Heat-Ray", `-editor.markdownMode preview` → `1000x580+500+55` | [editor.md](guide/editor.md) |
| `export-sheet` | "The Heat-Ray", `-autoSheet export` → `800x600+360+180` | [export.md](guide/export.md) |
| `book-settings` | "The Heat-Ray", `-autoSheet settings` → `470x530+525+210` | [goals.md](guide/goals.md) |
| `type-editor` | "The Heat-Ray", `-autoSheet types` → `800x600+360+180` | [entity-types.md](guide/entity-types.md) |
| `annotate-menu` | "The Heat-Ray"; drag-select a phrase in the paragraph where the beam is first described (CGEvent drag ~+665+247 → +850+247 window-relative), right-click the selection, **full-screen** capture (the menu is its own window) → crop `640x270+500+118` window-relative | [annotations.md](guide/annotations.md) |
| `split-here` | "The Heat-Ray"; right-click in the editor body (CGEvent right-click, screen 1500,700 with the window at 976,268), **region** capture of the menu's app items → `370x160` at screen `1455,678` (the menu is its own window, so capture the screen region, not the app window) | [manuscript.md](guide/manuscript.md) |
| `quick-insert` | "The Heat-Ray"; ⌘K then type `arti` → region capture of the card, `580x162+468+141` window-relative | [editor.md](guide/editor.md) |
| `editor-tabs` | "The Heat-Ray" pinned, a timeline tab, and a provisional (italic) tab from a single list click → crop of the tab strip | [editor.md](guide/editor.md) |
| `editor-tab-drag` | A tab dragged over the lower quarter of a pane, bottom half highlighted → crop of the editor area mid-drag | [editor.md](guide/editor.md) |
| `graph-controls` | Graph tab, `-autoSection graph` → crop of the control row (chips, outlines, re-layout, reset) | [graph.md](guide/graph.md) |
| `goal-popover` | Goal ring clicked (293,131 screen), Goal tab → region capture, crop `340x330+0+40` | [goals.md](guide/goals.md) |
| `goal-history` | …then History tab clicked (326,181) → same crop. Needs a seeded `.writingale/stats.json` in the /tmp book copy or the tab shows all zeros. | [goals.md](guide/goals.md) |

Capture-supporting edits to `app/ExampleBook`, made so sections aren't
photographed empty (all covered by `swift test --filter
ExampleBookTests`): the narrator carries `relationships:` entries for
his brother and the curate; *Text and rights (not part of the book)* is
`material: true` (and, deliberately, has no `time:` — as material it
sits in the timeline's untimed trailing strip); story times are
**hour-based** (`timeUnit: hour`), spread across the invasion so cards
don't stack; every chapter carries a timeline `row:` ("The Narrator",
"The Brother") so the timeline shows both threads running in parallel;
two chapters carry a `goal:` so the goal ring has something to show.

### Screenshot gaps

- **Line numbers + wrap column — docs AND shots pending**
  (2026-08-05, deferred at the user's request): the app gained a
  line-number gutter (logical lines; hidden in distraction-free,
  absent from the continuous column), a `Ln, Col` caret readout in
  the pane's status bar, and an optional wrap column (Settings →
  Editor, off by default, 80 characters measured in digit widths).
  [editor.md](guide/editor.md) has **no prose for any of this yet**
  (natural homes: a "Wrap column" subsection under "Font & line
  height", a "Line numbers" section, and a mention in the Saving
  section's status-bar sentence); every editor shot also now lacks
  the gutter and readout. New shots wanted: a crop of the gutter
  beside a wrapped paragraph (numbers skip continuation lines) and a
  crop of the Settings window's Editor section.

- **The `editor` full-window shot is stale (2026-07-31, worse since
  2026-08-03)**: the window toolbar gained a format capsule (heading
  menu, bold, italic, strikethrough, code, lists menu) left of the
  view-mode switcher, and the editor gained a tab strip in place of
  the slim title bar. Recapture `editor` and any crop whose band
  includes the toolbar. (`editor-split` was recaptured for panes and
  tabs on 2026-08-03.)
- **Format capsule close-up** ([editor.md](guide/editor.md) "Styling
  as you type"): a crop of the toolbar's format buttons.
- **Drag-to-reference** ([editor.md](guide/editor.md) "Links"): a shot
  mid-drag — a character row dragged from the list over the editor
  with the insertion caret visible.
- **Split buttons in the toolbar** ([editor.md](guide/editor.md)
  "Splitting"): a crop of the split-right/split-down buttons. The
  layout switcher they replaced is gone, along with its shot.
- **The Manuscript tab** ([editor.md](guide/editor.md) "More than
  documents"): a shot of the flowing column with a labeled chapter
  divider mid-view, and the chapter in view highlighted in the list.
  `-autoContinuous YES` opens the manuscript tab directly.
- **Reordering and nesting by drag** ([manuscript.md](guide/manuscript.md)
  "The tree", added 2026-08-04): two crops of the manuscript list
  mid-drag — one with the insertion rule on a row's edge (reorder),
  one with the outline around a part (nest). Both need a held drag, so
  the capture has to drive the mouse (`left_mouse_down`, move, capture,
  then release) rather than screenshot a settled window.

Pages with no screenshots that may not need one (simpler/textual
content — use judgement, not a hard rule): `installation.md`,
`manuscript.md`, `search.md`.

When adding a new capture, record its composition in the "Currently
captured" table above — and if the capture skill has been recreated by
then, extend its script and this table together.
