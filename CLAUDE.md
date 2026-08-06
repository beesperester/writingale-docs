# docs/ — notes for Claude

This is the Writingale user-facing documentation site (VitePress). See
the repo root [`CLAUDE.md`](../CLAUDE.md) for the brand-asset
conventions; see [`app/CLAUDE.md`](../app/CLAUDE.md) for the app itself.

## These docs are rebuilt in batches

Nothing here is updated alongside the app change that causes it. The app
repo records reader-visible changes in `app/DOCS-LOG.md`; a rebuild
happens only when asked for one, and starts by reading:

1. **`app/DOCS-LOG.md`** — what has changed since the last rebuild.
2. **[`FEATURES.md`](FEATURES.md)** — what is currently covered, page by
   page and screenshot by screenshot.

Then update the pages, recapture what the log invalidated (§ Screenshots
below, harness in [`capture/`](capture/)), regenerate the app's offline
help (`app/scripts/sync-help.sh`), and finish by marking the log entries
documented and bringing `FEATURES.md` back in line. A rebuild that
leaves those two files stale has broken the next one.

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

### The capture harness

**`docs/capture/` holds the scripts that take every shot** (rebuilt
2026-08-06, replacing the `docs-screenshots` skill retired on
2026-07-31). It is not part of the site — VitePress only builds `.md`,
and the directory is outside `public/`. Run the passes in order from
that directory:

```sh
./cap-full.sh light  && ./cap-crops.sh light
./cap-interact.sh light && ./cap-drags.sh light
# …then the same four with `dark`
```

`lib.sh` holds the mechanics; `cap-*.sh` hold the compositions, one
block per shot with the crop geometry beside it. Copy the results into
`public/screenshots/` when they look right. The terminal needs Screen
Recording **and** Accessibility permissions.

Mechanics worth knowing before changing anything:

- **Build first**, with a fresh `-derivedDataPath` and `-scheme
  Writingale`; `lib.sh` expects the app at
  `$SCRATCH/dd/Build/Products/Debug/Writingale.app`.
- **The book is a throwaway copy** of `app/ExampleBook` in `/tmp`.
  `reset_book` re-copies it — necessary before any pass that drags,
  because a completed drag really does reorder the book.
- **Every preference the shots depend on is pinned on the command
  line** (`BASELINE` in `lib.sh`). Without this a capture inherits
  whatever the developer last set — focus highlight, a non-default
  font, a stale timeline zoom. Note that a preference pinned this way
  is in the *argument domain* and **cannot be toggled from inside the
  app**: that is why `editor-hidden` passes
  `-editor.interfaceHidden YES` rather than pressing ⌘.
- **The locale is pinned too** (`-AppleLocale en_US`,
  `-AppleLanguages '("en-US")'`), and it is the easiest of these to
  overlook because nothing about the shot looks wrong. This site is
  written in en-US; on a German-configured Mac the app renders
  `60.000 words`, `15,5 pt`, `0,25x` and `31.12.2026`, which a reader
  parses as sixty words — and which flatly contradicts prose reading
  "15.5 pt" directly above the image. Check any recaptured shot with a
  number in it.
- **The workspace is deleted before each launch.** Panes and tabs
  persist into the book, so a launch would otherwise inherit the
  previous shot's layout.
- **Automation args**: `-autoOpenPath`, `-autoSelectName`,
  `-autoSelectType <plural>` (**always pass this with a name** — see
  below), `-autoInspector YES`, `-autoSection graph|timeline|<plural>`,
  `-autoSheet export|settings|types`, `-autoContinuous YES`.
- **`-autoSelectName` alone is not reproducible.** The example book's
  "The Heat-Ray" is both a chapter and an item, and the lookup walks a
  dictionary, so the `editor` shot came out as the item's 97-word page
  about half the time. `-autoSelectType chapters` pins it.
- Appearance is forced per shot (`-NSRequiresAquaSystemAppearance YES`
  / `-AppleInterfaceStyle Dark`), the window is normalized to
  1512×949 pt at a fixed origin, and `focused()` verifies the window is
  key by sampling the close button's red.
- **Per-window capture (`screencapture -l`) returns a blank image
  during an AppKit drag session.** Held-drag shots therefore capture
  the whole screen and crop the window out of it, *while the drag is
  still gliding* — see `hold_shot`. Drop indicators are drawn in
  response to the drag entering a target, so a capture taken after the
  pointer settles can miss them.
- **Menus and popovers are their own windows**, so they are captured
  with `screencapture -R` over a screen region, not per-window.
- **The graph's zoom is a trackpad pinch and cannot be synthesized.** A
  `CGEvent` magnify event is accepted but ignored by SwiftUI's
  `MagnifyGesture`, and posting one drops the window's key status. With
  28 chapters the spine is several pane-widths wide at 1:1, so the
  `graph` shot is a **pan** onto a legible stretch. A fitted whole-map
  shot would need a graph-zoom automation hook next to `-timeline.zoom`.

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
complete novel, 27 chapters across two books — at a 1512×949 window,
**recaptured in full on 2026-08-06** against the current app and the
current brand assets. Every composition below is scripted in
`capture/`; the tables are the index, the scripts are the source of
truth.

**Full-window** shots introduce whole views. Everything else is a
**crop** of a full-window capture — geometries in points, `WxH+X+Y`,
window origin top-left; the inspector column is `297x…+1215+…`.

Full-window (`cap-full.sh`, plus `journey` from `cap-crops.sh`):

| name | composition | used on |
|---|---|---|
| `welcome` | Welcome screen, no automation args (the recents list is the developer's own) | [what-is-writingale.md](guide/what-is-writingale.md), [quick-start.md](guide/quick-start.md) |
| `editor` | "The Heat-Ray" (the **chapter** — pass `-autoSelectType chapters`) in a single pane | [editor.md](guide/editor.md), [quick-start.md](guide/quick-start.md) |
| `editor-split` | The same chapter above a timeline tab (⌘⌥↓, then Views → Timeline), each pane with its own strip and status bar | [editor.md](guide/editor.md) |
| `editor-hidden` | Distraction-free, set by `-editor.interfaceHidden YES` | [editor.md](guide/editor.md) |
| `editor-manuscript` | The Manuscript tab (`-autoContinuous YES`), scrolled to a labeled chapter divider under a part's page | [editor.md](guide/editor.md) |
| `character` | "The Narrator" with the inspector open | [concepts.md](guide/concepts.md) |
| `journey` | "The Narrator" + inspector, scrolled 52 ticks to the Journey section | [journeys.md](guide/journeys.md) |
| `graph` | Graph tab, settled 8s, then **panned** onto Book Two's stretch of the spine (drag 1300,750 → 640,860). The whole map does not fit — see the zoom note above | [graph.md](guide/graph.md) |
| `timeline` | Timeline tab at `-timeline.zoom 0.25`, scrolled right 14 and down 5, so the bands, both orders of row pinning, the scale break and the journey deck are all in frame | [timeline.md](guide/timeline.md) |

Crops (`cap-crops.sh` unless noted):

| name | source + crop | used on |
|---|---|---|
| `inspector-overview` | "The Days of Imprisonment" + inspector → `297x88+1215+52` | [inspector.md](guide/inspector.md) |
| `inspector-identity` | same → `297x182+1215+138` | [inspector.md](guide/inspector.md) |
| `inspector-completion` | same → `297x64+1215+315` | [inspector.md](guide/inspector.md) |
| `inspector-goal` | same → `297x196+1215+378` (goal 6,000, Material toggle in frame) | [inspector.md](guide/inspector.md), [goals.md](guide/goals.md) |
| `inspector-storytime` | "The gas jets on Mars" + inspector → `297x212+1215+306` (`cap-interact.sh` — negative time is the teaching point) | [inspector.md](guide/inspector.md) |
| `inspector-nesting` | "Book One — The Coming of the Martians" + inspector, scrolled 8 → `297x395+1215+508` (Nesting, derived Progress, Contents) | [inspector.md](guide/inspector.md) |
| `inspector-annotates` | "Why the Martians fail" + inspector, scrolled 8 → `297x145+1215+403` (one quoted pin, one whole-document) | [inspector.md](guide/inspector.md) |
| `inspector-referencedby` | same → `297x255+1215+678` | [inspector.md](guide/inspector.md) |
| `inspector-notes` | "Dead London" + inspector, scrolled 8 → `297x140+1215+713` | [inspector.md](guide/inspector.md) |
| `inspector-relationships` | "The Narrator" + inspector → `297x240+1215+286` | [inspector.md](guide/inspector.md) |
| `inspector-journey` | "The Narrator" + inspector, scrolled 52 → `297x480+1215+455` | [inspector.md](guide/inspector.md) |
| `inspector-fields-single` | "The New Order" + inspector → `297x140+1215+483` (motto, founded, seat) | [inspector.md](guide/inspector.md) |
| `inspector-fields-multi` | same → `297x275+1215+626` (Holdings, Members) | [inspector.md](guide/inspector.md) |
| `inspector-image` | "Cover" + inspector → `297x462+1215+286` | [inspector.md](guide/inspector.md) |
| `editor-focus` | "The Heat-Ray", `-editor.focusHighlight sentence`, caret clicked at 900,450 → `1000x560+500+88` | [editor.md](guide/editor.md) |
| `editor-raw` | "The Heat-Ray", `-editor.markdownMode raw` → `1000x560+500+88` | [editor.md](guide/editor.md) |
| `editor-preview` | "The Heat-Ray", `-editor.markdownMode preview` → `1000x560+500+88` | [editor.md](guide/editor.md) |
| `editor-format-buttons` | Toolbar → `220x44+688+4` | [editor.md](guide/editor.md) |
| `editor-split-buttons` | Toolbar → `120x44+930+4` | [editor.md](guide/editor.md) |
| `editor-view-switcher` | Toolbar → `116x44+1074+4` | [editor.md](guide/editor.md) |
| `editor-line-numbers` | The gutter beside wrapped paragraphs → `560x230+462+88` | [editor.md](guide/editor.md) |
| `export-sheet` | `-autoSheet export` → `800x600+360+180` | [export.md](guide/export.md) |
| `book-settings` | `-autoSheet settings`, **scrolled 10** — the row order and the writing goal are both below the fold → `470x530+525+210` | [goals.md](guide/goals.md), [timeline.md](guide/timeline.md) |
| `type-editor` | `-autoSheet types` → `800x600+360+180` | [entity-types.md](guide/entity-types.md) |
| `graph-controls` | Graph tab → `530x58+470+88` (chips, outlines, re-layout, reset — no share button) | [graph.md](guide/graph.md) |
| `timeline-controls` | Timeline header → `1045x50+462+88` (type chips, ordering, summary, zoom) | [timeline.md](guide/timeline.md) |

Driven shots (`cap-interact.sh`):

| name | composition | used on |
|---|---|---|
| `settings-editor` | ⌘, with `-editor.wrapColumnEnabled YES`; the Settings **window** (`windowid --smallest`) → `440x412+0+90` | [editor.md](guide/editor.md) |
| `view-search` | Timeline tab, ⌘F, type `storm`, Return to step → `1045x570+462+88` | [search.md](guide/search.md) |
| `quick-insert` | ⌘K then `arti` → `600x320+456+120` | [editor.md](guide/editor.md) |
| `goal-popover` | Goal ring clicked (194,70) → region `245x275` at window `+85+88` | [goals.md](guide/goals.md) |
| `goal-history` | …then the History tab (235,129). **Needs `.writingale/stats.json`** — `seed_stats` in `lib.sh` writes eight days ending today, or the tab is a column of zeros | [goals.md](guide/goals.md) |
| `split-here` | Right-click in the editor body (900,430) → region `400x220` at window `+880+410` | [manuscript.md](guide/manuscript.md) |
| `annotate-menu` | Drag-select a phrase, right-click it → region `420x300` at window `+740+227` | [annotations.md](guide/annotations.md) |
| `editor-tabs` | Chapter pinned by double-click, a timeline tab, then one list click for a provisional (italic) tab → `620x36+462+52` | [editor.md](guide/editor.md) |
| `timeline-breadcrumb` | Timeline at `-timeline.zoom 0.25`, scrolled right 14, then a **double-click on Book One's band** (700,182) → `1045x420+462+88` | [timeline.md](guide/timeline.md) |

Held-drag shots (`cap-drags.sh` — see `hold_shot`):

| name | composition | used on |
|---|---|---|
| `editor-tab-drag` | A tab dragged from the strip to 980,800, lower half of the pane highlighted → `1045x520+462+400` | [editor.md](guide/editor.md) |
| `editor-drag-reference` | A character row (`-autoSection characters`) dragged over the text, insertion caret visible → `1045x340+462+120` | [editor.md](guide/editor.md) |
| `manuscript-reorder` | A chapter row dragged onto another row's edge, insertion rule showing → `240x330+220+60` | [manuscript.md](guide/manuscript.md) |

Capture-supporting edits to `app/ExampleBook`, made so sections aren't
photographed empty (all covered by `swift test --filter
ExampleBookTests`): the narrator carries `relationships:` entries for
his brother and the curate; *Text and rights (not part of the book)* is
`material: true` (and, deliberately, has no `time:` — as material it
sits in the timeline's untimed trailing strip); story times are
**hour-based** (`timeUnit: hour`), spread across the invasion so cards
don't stack; every chapter carries a timeline `row:` ("The Narrator",
"The Brother") so the timeline shows both threads running in parallel;
two chapters carry a `goal:` so the goal ring has something to show;
*Note on the epigraph* keeps a deliberately **stale** annotation, and
*Why the Martians fail* two healthy ones — the latter is what the
`inspector-annotates` crop photographs.

### Screenshot gaps

One shot, and it is a mechanical limitation rather than a missing
decision. The prose for it exists in
[manuscript.md](guide/manuscript.md) § The tree.

- **`manuscript-nest`** — the list mid-drag with the accent *outline*
  around a part (the nest zone), as opposed to `manuscript-reorder`'s
  insertion rule. The zone itself is reachable (`zone(at:)` in
  `MainWindow.swift`: a 6–10 pt bite at each edge, everything between
  nests), but SwiftUI draws the drag image centred on the pointer, and
  the pointer has to be *in the middle of the target row* — so the
  image covers the very outline the shot is for. A staged capture, or
  an offset drag image, would be needed.

When adding a new capture, add a block to the right `cap-*.sh` and a
row to the tables above in the same pass. A composition that lives only
in one of the two goes stale silently.
