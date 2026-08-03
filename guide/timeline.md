# Timeline View

The timeline lays your story out against **story time**, counted in a unit you choose in Book Settings — months for the example book, days or years for yours. 0 is the beginning of the book; negative values are backstory.

<img src="/screenshots/timeline-light.png" alt="The timeline view of the example book" class="light-only">
<img src="/screenshots/timeline-dark.png" alt="The timeline view of the example book" class="dark-only">

Open the timeline from **Views** in the sidebar and it appears as a tab in the editor — put it in a [split](/guide/editor#splitting) and you can write with the shape of the book underneath you.

## What you're seeing

- **Container bands** across the top — parts with their derived progress (`2/4 final`), spanning the time their chapters cover.
- **Type rows** — each kind of thing with a place in time gets a row; cards show the progress ring, the time label, and the POV character. Cards that overlap in time stack.
- **Named rows** — a kind can have its own row (the example book's notes share a *World Events* row), and any single entity can be moved to a row of its own from the inspector — so different strands of world history read as separate strips.
- **Journey lanes** at the bottom — one lane per character (or item), marking where along the axis they appear. See [Journeys](/guide/journeys).

The example book's *Kuno's ascent* sits at month −12 — backstory, visible at a glance to the left of 0.

## The glance panel

Clicking any timeline item — a card, a band, or a journey marker — shows it in the panel on the right: status, story time, POV, and the full text with every link readable. You can skim a chapter without leaving the timeline; the **Open** button jumps to it in the editor when you want to write. The panel is the same inspector you know from the editor — the toolbar's sidebar button and <kbd>⌘4</kbd> show and hide it.

## Story order vs. manuscript order

The toggle at the top switches the horizontal arrangement:

- **Story Order** — position by story time (the picture above).
- **Manuscript Order** — position by place in the book, which makes flashbacks and non-linear structure jump out: a chapter that sits late in the book but early in story time is a flashback, and here you can see it.

Cards can be dragged to reorder where the view allows it.

## Giving something a place in time

Select the entity and fill in the inspector's **Story Time** section: **From** (required to appear on the timeline), an optional **To** for things that span time, a human-readable **Label** ("the last day"), and optionally a **Row** of its own. See [the inspector](/guide/inspector#story-time).

## Saving the timeline

The share button in the top-right corner writes the timeline to a **PDF** — every column, however far it scrolls off screen, on a single page in whichever order you're viewing. See [Exporting](/guide/export#exporting-the-graph-and-the-timeline).
