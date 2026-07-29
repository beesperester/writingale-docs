# The Inspector

The inspector (<kbd>⌘4</kbd>, or the toolbar button) is the structured side of the selected entity. It is **composed from the type's traits** — a chapter shows status and story time; a character shows relationships and journey; your custom faction shows its custom fields. Sections you see:

<img src="/screenshots/character-light.png" alt="Character inspector with relationships and traits" class="light-only">
<img src="/screenshots/character-dark.png" alt="Character inspector with relationships and traits" class="dark-only">

## Identity

Name, type, creation date, and the entity's **Reference** — the `[[uid]]` token, one click to copy, ready to paste into any document.

## Completion — *status trait*

The stage picker (outline / draft / revision / final by default — stages are configurable per type). Containers show derived progress instead.

## Writing Goal

A per-entity word target. The list column shows progress against it (`363 / 1500 words`), independent of the book-wide goal.

## Material

The [aside-material toggle](/guide/manuscript#material) — keeps the entity in the tree but out of export, goals, and progress.

## Story Time — *timeline trait*

`From`, `To`, a human `Label` ("Ledger-day, morning"), and the `Row` the entity occupies on the timeline. Time is counted in the book's time unit (days, hours, years — set in Book Settings); **0 is the beginning of the book, negative values lie before it.**

## Image — *image trait*

A preview of the picture the entity labels, plus the stored file's content-hash path. To swap the picture, click **Replace…** (a file dialog, images only) or **drop an image file onto the preview** — the entity keeps its uid, label, notes, and every embed of it; only the stored binary changes (the old one is cleaned up unless another entity still uses it). See [Images](/guide/editor#images).

## Relationships — *relationships trait*

Typed links to other entities with a free-form kind ("creditor", "old friend", "rivals") and an optional note. Relationships are edited here and rendered as edges in the graph.

## Nesting & Contents — *manuscript trait*

Where the entity sits in the manuscript tree, and what it contains — with buttons to add existing entities or create new children in place.

## Annotates / Notes — *annotator trait*

What this entity annotates (with quote previews and stale flags), or which annotator entities are attached to this document. See [Annotations](/guide/annotations).

## Fields

Your type's custom fields, in schema order — text, numbers, lists, and reference pickers.

## Referenced By

Backlinks: every entity whose prose or fields point at this one. The example book's protagonist is referenced by fifteen entities — chapters that cast her, items she owns, notes about her.

## Journey — *journey trait*

The inferred appearance list — see [Journeys](/guide/journeys).

<img src="/screenshots/journey-light.png" alt="Journey section with POV badges" class="light-only">
<img src="/screenshots/journey-dark.png" alt="Journey section with POV badges" class="dark-only">
