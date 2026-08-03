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

All from the bundled example book, *The Machine Stops*, at a 1512×949
window. **Full-window** shots introduce whole views; everything else is
a **crop** of a full-window capture (crop geometries in points,
`WxH+X+Y`, window origin top-left; the inspector column is
`297x…+1215+…`).

Full-window:

| name | composition | used on |
|---|---|---|
| `welcome` | Welcome screen, no automation args | [what-is-writingale.md](guide/what-is-writingale.md), [quick-start.md](guide/quick-start.md) |
| `editor` | "The Journey North" open | [editor.md](guide/editor.md), [quick-start.md](guide/quick-start.md) |
| `editor-split` | Same, split layout (⌥⌘2 via System Events keystroke) | [editor.md](guide/editor.md) |
| `editor-hidden` | "The Journey North", Hide Interface toggled (⌘. via System Events keystroke) | [editor.md](guide/editor.md) |
| `character` | "Vashti" with inspector open | [concepts.md](guide/concepts.md) |
| `journey` | "Kuno" with inspector open, scrolled to bottom (30 ticks) | [journeys.md](guide/journeys.md) |
| `graph` | Graph view, settled layout | [graph.md](guide/graph.md) |
| `timeline` | Timeline view (month-based spacing — chapters at months 0/2/3/4, spans to 84) | [timeline.md](guide/timeline.md) |

Crops (source composition → crop):

| name | source + crop | used on |
|---|---|---|
| `inspector-overview` | "Kuno's Story" + inspector, top → `297x70+1215+62` | [inspector.md](guide/inspector.md) |
| `inspector-identity` | same → `297x175+1215+135` | [inspector.md](guide/inspector.md) |
| `inspector-completion` | same → `297x70+1215+312` | [inspector.md](guide/inspector.md) |
| `inspector-goal` | "The Old Opening (cut)" + inspector (material on, goal 400) → `297x200+1215+362` | [inspector.md](guide/inspector.md), [goals.md](guide/goals.md) |
| `inspector-storytime` | "Kuno's ascent" + inspector (From −12 months) → `297x225+1215+300` | [inspector.md](guide/inspector.md) |
| `inspector-image` | "Cover" + inspector → `297x430+1215+285` | [inspector.md](guide/inspector.md) |
| `inspector-relationships` | "Vashti" + inspector → `297x155+1215+285` | [inspector.md](guide/inspector.md) |
| `inspector-nesting` | "Part I — The Air-Ship" + inspector, scrolled 8 ticks → `297x407+1215+128` | [inspector.md](guide/inspector.md) |
| `inspector-annotates` | "Note on the old opening" + inspector → `297x110+1215+515` | [inspector.md](guide/inspector.md) |
| `inspector-notes` | "The Room and the Plate" + inspector, scrolled 14 ticks → `297x132+1215+228` | [inspector.md](guide/inspector.md) |
| `inspector-fields-single` | "The Central Committee" + inspector → `297x130+1215+485` | [inspector.md](guide/inspector.md) |
| `inspector-fields-multi` | "Kuno's Story" + inspector, scrolled 14 ticks → `297x350+1215+330` | [inspector.md](guide/inspector.md) |
| `inspector-referencedby` | same → `297x240+1215+695` | [inspector.md](guide/inspector.md) |
| `inspector-journey` | "Kuno" + inspector, scrolled to bottom → `297x610+1215+325` | [inspector.md](guide/inspector.md) |
| `editor-focus` | "The Journey North", `-editor.focusHighlight sentence`, caret clicked into the last paragraph's second sentence → `1000x580+500+55` | [editor.md](guide/editor.md) |
| `editor-raw` | "The Journey North", `-editor.markdownMode raw` → `1000x580+500+55` | [editor.md](guide/editor.md) |
| `editor-preview` | "The Journey North", `-editor.markdownMode preview` → `1000x580+500+55` | [editor.md](guide/editor.md) |
| `export-sheet` | "The Journey North", `-autoSheet export` → `800x600+360+180` | [export.md](guide/export.md) |
| `book-settings` | "The Journey North", `-autoSheet settings` → `470x530+525+210` | [goals.md](guide/goals.md) |
| `type-editor` | "The Journey North", `-autoSheet types` → `800x600+360+180` | [entity-types.md](guide/entity-types.md) |
| `annotate-menu` | "The Journey North"; drag-select a phrase on the "commits an atrocity" line (CGEvent drag ~+665+247 → +850+247 window-relative), right-click the selection, **full-screen** capture (the menu is its own window) → crop `640x270+500+118` window-relative | [annotations.md](guide/annotations.md) |
| `goal-popover` | Goal ring clicked (293,131 screen), Goal tab → region capture, crop `340x330+0+40` | [goals.md](guide/goals.md) |
| `goal-history` | …then History tab clicked (326,181) → same crop. Needs a seeded `.writingale/stats.json` in the /tmp book copy or the tab shows all zeros. | [goals.md](guide/goals.md) |

Capture-supporting edits to `app/ExampleBook`, made so sections aren't
photographed empty (all covered by `swift test --filter
ExampleBookTests`): Vashti/Kuno carry a mother/son `relationships:`
entry; *The Old Opening (cut)* has `goal: 400` (and, deliberately, no
`time:` — as material it sits in the timeline's untimed trailing
column); story times are **month-based** (`timeUnit: month`), spaced so
timeline columns don't stack.

### Screenshot gaps

- **All `editor*` full-window shots are stale (2026-07-31)**: the
  window toolbar gained a format capsule (heading menu, bold, italic,
  strikethrough, code, lists menu) left of the view-mode switcher.
  Recapture `editor`, `editor-split`, and any crop whose band includes
  the toolbar.
- **Format capsule close-up** ([editor.md](guide/editor.md) "Styling
  as you type"): a crop of the toolbar's format buttons.
- **Drag-to-reference** ([editor.md](guide/editor.md) "Links"): a shot
  mid-drag — a character row dragged from the list over the editor
  with the insertion caret visible.
- **Editor-layout switcher** ([editor.md](guide/editor.md) "Three ways
  to lay out the editor"): a crop of the toolbar capsule showing the
  three layouts with one selected. `-autoContinuous YES` opens the
  continuous layout directly.
- **Continuous scroll** (same section): a shot of the flowing column
  with a labeled chapter divider mid-view, and the chapter in view
  highlighted in the list.

Pages with no screenshots that may not need one (simpler/textual
content — use judgement, not a hard rule): `installation.md`,
`manuscript.md`, `search.md`.

When adding a new capture, record its composition in the "Currently
captured" table above — and if the capture skill has been recreated by
then, extend its script and this table together.
