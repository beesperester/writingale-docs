# Feature inventory — what the app does, and where it's documented

**This file is not published.** It is the coverage half of the rebuild
checklist: one row per user-visible feature, with the page that explains
it and the screenshot that shows it. It answers *"is this documented?"* —
`app/DOCS-LOG.md` answers *"what changed since last time?"*. A rebuild
needs both, and finishes by updating both.

Sources, in the order a rebuild should reach for them:

| Source | What it is good for |
|---|---|
| [`app/DOCS-LOG.md`](../app/DOCS-LOG.md) | **Start here.** Dated entries for every reader-visible change, with the pages and screenshots each one affects. Anything still marked `pending` is this rebuild's work |
| This file | What is already covered, so the log's entries can be slotted against real pages and shots |
| [`app/README.md`](../app/README.md) | The closest thing to a feature list; the "Status" section is a near-complete inventory, and "Project format" is authoritative on the on-disk format |
| [`app/DESIGN.md`](../app/DESIGN.md) | Why a feature works the way it does, when the log's one-line summary isn't enough to write from. "Current state" describes every surface as it stands |
| [`app/ARCHITECTURE.md`](../app/ARCHITECTURE.md) | Module map; useful for finding the code behind a feature |
| The app itself | The final authority. Launch it against `app/ExampleBook` — see the capture mechanics in [`CLAUDE.md`](CLAUDE.md) |

**Status column**: ✅ documented with a screenshot · 📝 documented,
no screenshot (and arguably fine without one) · ⚠️ gap.

---

## Window & layout

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Three columns: sidebar → entity list → editor area | [editor](guide/editor.md) | `editor` | ✅ |
| Views (Manuscript, Graph, Timeline) open as **tabs**, not column replacements | [editor](guide/editor.md) § More than documents | `editor-split` | ✅ |
| Inspector on the trailing edge (⌘4), follows the focused pane | [inspector](guide/inspector.md) | `character` | ✅ |
| Distraction-free mode (⌘.) — centred column, floating word counter | [editor](guide/editor.md) § Writing modes | `editor-hidden` | ✅ |
| Welcome screen: recents sidebar + branding column | [what-is-writingale](guide/what-is-writingale.md), [quick-start](guide/quick-start.md) | `welcome` | ✅ |
| Close Book (⇧⌘W) returns to the welcome screen | [quick-start](guide/quick-start.md) | — | 📝 |
| Help → Writingale Help (⌘?) — the offline copy of these docs | [installation](guide/installation.md) | — | 📝 |
| Back/forward capsule (⌘[ / ⌘]) | [editor](guide/editor.md) § Links | `editor` | ✅ |

## Toolbar

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Format capsule: headings, bold, italic, strikethrough, code, lists/quote/comment | [editor](guide/editor.md) § Styling as you type | `editor-format-buttons` | ✅ |
| Split Right / Split Down / Close Editor buttons | [editor](guide/editor.md) § Splitting | `editor-split-buttons` | ✅ |
| Markdown view switcher (live / preview / raw), per pane | [editor](guide/editor.md) § Three views of your text | `editor-view-switcher` | ✅ |
| Context-aware Export button | [export](guide/export.md) | `export-sheet` | ✅ |
| Context-aware Find button | [search](guide/search.md) | `view-search` | ✅ |
| New-entity **+** menu beside the list column | [concepts](guide/concepts.md) | — | 📝 |

## Editor

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Live markdown styling (markers visible but dimmed) | [editor](guide/editor.md) § Styling as you type | `editor` | ✅ |
| Blockquotes set off by their own indent | [editor](guide/editor.md) | `editor-manuscript` | ✅ |
| Reading preview (⌘⇧P) | [editor](guide/editor.md) § Preview | `editor-preview` | ✅ |
| Raw markdown (⌘⇧R) | [editor](guide/editor.md) § Raw markdown mode | `editor-raw` | ✅ |
| Font family / size / line height (Settings) | [editor](guide/editor.md) § Font & line height | `settings-editor` | ✅ |
| **Wrap column** (Settings → Editor, off by default, 80 ch) | [editor](guide/editor.md) § Wrap column | `settings-editor` | ✅ |
| **Line-number gutter** — logical lines, continuation lines unnumbered | [editor](guide/editor.md) § Line numbers | `editor-line-numbers` | ✅ |
| **`Ln X, Col Y`** caret readout in the pane's status bar | [editor](guide/editor.md) § Line numbers, § Saving | `editor` | ✅ |
| Focus highlight — line / sentence / paragraph | [editor](guide/editor.md) § Writing modes | `editor-focus` | ✅ |
| Typewriter scrolling — top / center / bottom | [editor](guide/editor.md) § Writing modes | — | 📝 |
| `[[` autocomplete; `[[uid\|display text]]` overrides | [editor](guide/editor.md) § Links | — | 📝 |
| ⌘-click to follow a reference (pointing-hand cursor on ⌘-hover) | [editor](guide/editor.md) § Links | — | 📝 |
| Drag an entity row into the text to insert a reference | [editor](guide/editor.md) § Links | `editor-drag-reference` | ✅ |
| Quick insert (⌘K) — references, type prefixes, commands, document jumper | [editor](guide/editor.md) § Quick insert | `quick-insert` | ✅ |
| Images: drop to import (content-addressed), `![[uid]]` renders inline | [editor](guide/editor.md) § Images | `inspector-image` | ✅ |
| Split Here (right-click) | [manuscript](guide/manuscript.md) § Splitting a chapter in two | `split-here` | ✅ |
| Annotate from a selection (right-click) | [annotations](guide/annotations.md) | `annotate-menu` | ✅ |
| Document ingest — drop `.md`/`.txt` on sidebar, list, or editor | [manuscript](guide/manuscript.md) § Documents from outside | — | 📝 |
| Drag a row out to Finder as a `.md` file | [manuscript](guide/manuscript.md) § Documents from outside | — | 📝 |

## Panes & tabs

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Tabs, with provisional (italic) preview tabs | [editor](guide/editor.md) § Tabs | `editor-tabs` | ✅ |
| Close button lights up under the pointer | [editor](guide/editor.md) § Tabs | `editor-tabs` | ✅ |
| Splits nest freely (⌘⌥→ / ⌘⌥↓ / ⌘⌥W) | [editor](guide/editor.md) § Splitting | `editor-split` | ✅ |
| Drag tabs: reorder, move to another pane, drop on an edge to split | [editor](guide/editor.md) § Dragging tabs | `editor-tab-drag` | ✅ |
| Drop an entity row on a tab strip to open it there | [editor](guide/editor.md) § Dragging tabs | — | 📝 |
| Per-pane word count, saved state, and view mode | [editor](guide/editor.md) § Splitting | `editor-split` | ✅ |
| Manuscript tab — the whole book as one editable column | [editor](guide/editor.md) § More than documents | `editor-manuscript` | ✅ |
| Workspace (panes, tabs) persisted per book | [editor](guide/editor.md) § It's remembered | — | 📝 |

## Saving

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Manual saving only — ⌘S / ⌥⌘S, no auto-save | [editor](guide/editor.md) § Saving | `editor` | ✅ |
| Dirty indicators: `*` in the tab, *Edited* in the status bar, accent dots in the lists | [editor](guide/editor.md) § Saving | — | 📝 |
| Quit / Close Book prompts while anything is unsaved | [editor](guide/editor.md) § Saving | — | 📝 |

## Manuscript

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Nesting tree, any depth | [manuscript](guide/manuscript.md) § The tree | `editor` | ✅ |
| Reorder by dragging a row onto another's edge | [manuscript](guide/manuscript.md) § The tree | `manuscript-reorder` | ✅ |
| Nest by dragging a row onto another's middle | [manuscript](guide/manuscript.md) § The tree | `manuscript-nest` | ⚠️ shot blocked — see below |
| Right-click → Move Into | [manuscript](guide/manuscript.md) § The tree | — | 📝 |
| Stage-progress rings; a container's ring averages its leaves | [manuscript](guide/manuscript.md) § Progress rings | `inspector-nesting` | ✅ |
| Merge into the document above | [manuscript](guide/manuscript.md) § Joining two chapters | — | 📝 |
| Material flag — in the tree, out of export/goals/progress | [manuscript](guide/manuscript.md) § Material | `inspector-goal` | ✅ |

## Inspector

| Section | Page | Screenshot | Status |
|---|---|---|---|
| Overview chips | [inspector](guide/inspector.md) § Overview | `inspector-overview` | ✅ |
| Identity (name, type, reference token, created) | [inspector](guide/inspector.md) § Identity | `inspector-identity` | ✅ |
| Image preview + Replace | [inspector](guide/inspector.md) § Image | `inspector-image` | ✅ |
| Completion (status picker) | [inspector](guide/inspector.md) § Completion | `inspector-completion` | ✅ |
| Writing Goal + Material | [inspector](guide/inspector.md) § Writing Goal & Material | `inspector-goal` | ✅ |
| Relationships | [inspector](guide/inspector.md) § Relationships | `inspector-relationships` | ✅ |
| Story Time (From / To / Label / Row) | [inspector](guide/inspector.md) § Story Time | `inspector-storytime` | ✅ |
| Nesting / Progress / Contents | [inspector](guide/inspector.md) § Nesting, Progress & Contents | `inspector-nesting` | ✅ |
| Annotates | [inspector](guide/inspector.md) § Annotates | `inspector-annotates` | ✅ |
| Notes | [inspector](guide/inspector.md) § Notes | `inspector-notes` | ✅ |
| Custom fields — single-value | [inspector](guide/inspector.md) § Fields | `inspector-fields-single` | ✅ |
| Custom fields — multi-value | [inspector](guide/inspector.md) § Fields | `inspector-fields-multi` | ✅ |
| Referenced By | [inspector](guide/inspector.md) § Referenced By | `inspector-referencedby` | ✅ |
| Journey | [inspector](guide/inspector.md) § Journey | `inspector-journey` | ✅ |

## Graph

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Manuscript spine + story-world clusters, labeled outlines | [graph](guide/graph.md) | `graph` | ✅ |
| Distance fading; a selected node keeps its edges lit | [graph](guide/graph.md) § Reading the graph | `graph` | ✅ |
| Type filter chips, group-outline toggle, re-layout, reset | [graph](guide/graph.md) § Controls | `graph-controls` | ✅ |
| Click a node → glance panel; double-click → open | [graph](guide/graph.md) | `graph` | ✅ |
| Pan by dragging; **zoom by pinching only** — no key, no preference | [graph](guide/graph.md) § Controls | — | ⚠️ see note below |
| A type can be kept off the graph entirely | [entity-types](guide/entity-types.md) | — | 📝 |

> **Note for the next capture run.** With 28 chapters the graph's spine
> is several pane-widths wide at 1:1, and its zoom is a trackpad pinch —
> which cannot be synthesized (a `CGEvent` magnify event is delivered but
> SwiftUI's `MagnifyGesture` ignores it, and posting one drops the
> window's key status). The `graph` shot is therefore a **pan** onto Book
> Two's stretch of the spine, not the whole map. If a fitted whole-map
> shot is ever wanted, the app would need a graph-zoom automation hook
> next to `-timeline.zoom`.

## Timeline

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Story Order on a proportional axis; cards sized by span | [timeline](guide/timeline.md) § What you're seeing | `timeline` | ✅ |
| Abbreviated empty stretches + scale-break glyph (Settings → Timeline) | [timeline](guide/timeline.md) § Skipped stretches | `timeline` | ✅ |
| Pinned ruler with major/minor ticks | [timeline](guide/timeline.md) | `timeline` | ✅ |
| Container bands as permanent top chrome | [timeline](guide/timeline.md) § What you're seeing | `timeline` | ✅ |
| Named rows; row pills pin at the viewport edges | [timeline](guide/timeline.md) § What you're seeing | `timeline` | ✅ |
| **Row Order** as a book setting (Settings → Book) | [timeline](guide/timeline.md) § Row order | `book-settings` | ✅ |
| Journey lanes pinned to the bottom | [timeline](guide/timeline.md), [journeys](guide/journeys.md) | `timeline` | ✅ |
| Unscheduled strip | [timeline](guide/timeline.md) § What you're seeing | — | 📝 |
| **Type filter chips** in the header | [timeline](guide/timeline.md) § Choosing what shows | `timeline-controls` | ✅ |
| Zoom − / + buttons, one octave a click; double-click to reset | [timeline](guide/timeline.md) § Giving the board more room | `timeline-controls` | ✅ |
| **Drill into a part** (double-click a band) + breadcrumb back | [timeline](guide/timeline.md) § Focusing on one part | `timeline-breadcrumb` | ✅ |
| Drag to reschedule / regroup / resize / unschedule | [timeline](guide/timeline.md) § Rearranging by dragging | — | 📝 |
| Manuscript Order — even numbered strip; drag to reorder the book | [timeline](guide/timeline.md) § Story order vs. manuscript order | — | 📝 |
| Glance panel on click | [timeline](guide/timeline.md) § The glance panel | — | 📝 |

## Search

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| List filter bar with scope chip (name / headings / body / comments / annotations / fields) | [search](guide/search.md) § Filtering the list | — | 📝 |
| ⌘F in a text tab — the native find bar | [search](guide/search.md) § Find in the current document | — | 📝 |
| **⌘F in a graph or timeline tab — the view's own search bar** | [search](guide/search.md) § Finding things in the graph and timeline | `view-search` | ✅ |
| Matches highlight in place (accent ring, everything else recedes) | [search](guide/search.md) | `view-search` | ✅ |
| "3 of 12" counter, ⌃/⌄ and Return to step, stepping centres the match | [search](guide/search.md) | `view-search` | ✅ |

## Goals & statistics

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Book-wide goal ring in the sidebar header | [goals](guide/goals.md) | `goal-popover` | ✅ |
| Goal popover — Goal and History tabs | [goals](guide/goals.md) | `goal-popover`, `goal-history` | ✅ |
| Per-chapter word target | [goals](guide/goals.md), [inspector](guide/inspector.md) | `inspector-goal` | ✅ |
| Book Settings sheet (title, author, time unit, row order) | [goals](guide/goals.md) | `book-settings` | ✅ |

## Types

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| Entity type editor — traits, stages, fields, icon, colour, folder | [entity-types](guide/entity-types.md) | `type-editor` | ✅ |
| Default template; unrecognized types load and stay visible | [entity-types](guide/entity-types.md) | — | 📝 |

## Export

| Feature | Page | Screenshot | Status |
|---|---|---|---|
| One Export command, aimed by the focused tab (⇧⌘E) | [export](guide/export.md) § Export exports what you're looking at | — | 📝 |
| Prose export sheet — options + live preview, markdown or PDF | [export](guide/export.md) § The export sheet | `export-sheet` | ✅ |
| Broken-link warnings; comments stripped; material excluded | [export](guide/export.md) § What export does | `export-sheet` | ✅ |
| Graph / timeline as one-page PDFs, through their own options sheet | [export](guide/export.md) § Exporting the graph and the timeline | — | 📝 |
| Timeline export scope (whole book vs. the focused group) | [export](guide/export.md) | — | 📝 |

## Not documented on purpose

- **The demo edition** (`WritingaleDemo`, read-only). It is a
  distribution decision, not a feature of the app the reader bought.
- **Anything about building the app or the repository.** Writingale
  ships through the App Store and is not open source — see the root
  `CLAUDE.md`.

---

## Open gaps

Everything the 2026-08-06 rebuild left undone. Each is a screenshot,
not a documentation hole — the prose for all of these is written.

1. **`manuscript-nest`** — the list mid-drag with the accent outline
   around a part. Blocked: SwiftUI centres the drag image on the
   pointer, and the pointer has to sit in the target row's middle for
   the nest zone, so the image covers the outline. `manuscript-reorder`
   (the insertion rule) was captured and carries the section.
2. **A whole-map `graph` shot** — blocked on graph zoom being a
   trackpad pinch. See the note under *Graph* above.
