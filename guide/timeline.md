# Timeline View

The timeline lays your story out against **story time**: a signed numeric axis in the book's time unit (years for the example book — configurable in Book Settings). 0 is the beginning of the book; negative values are backstory.

<img src="/screenshots/timeline-light.png" alt="The timeline view of the example book" class="light-only">
<img src="/screenshots/timeline-dark.png" alt="The timeline view of the example book" class="dark-only">

## What you're seeing

- **Container bands** across the top — parts and chapters with their derived progress (`2/4 final`), spanning the time their contents cover.
- **Type rows** — each timeline-enabled type gets a row; cards show status dot, time label, and POV. Overlapping cards stack.
- **Named rows** — a type can declare its own row (the default Notes type uses *World Events*), and any single entity can override its row (`time: { row: Machine History }`), so different strands of world history read as separate strips.
- **Journey lanes** at the bottom — one lane per journey-trait entity, marking where along the axis each character or item appears.

The example book's *Kuno's ascent* sits at year −1 — backstory visible at a glance to the left of year 0.

## The glance panel

Clicking any timeline item — a card, a container band, or a journey marker — shows its contents in the inspector panel on the right: status, story time, POV, and the full body rendered with references resolved. You can skim a chapter without leaving the timeline; the **Open** button jumps to it in the editor when you want to write. The panel is the same inspector you know from the editor: the toolbar's sidebar button and <kbd>⌘4</kbd> show and hide it, and arriving with an entity selected pre-fills it.

## Story order vs. manuscript order

The toggle at the top switches the horizontal arrangement:

- **Story Order** — position by story time (the picture above).
- **Manuscript Order** — position by place in the manuscript tree, which makes flashbacks and non-linear structure jump out: a card that sits early in manuscript order but far left in story time is a flashback.

Cards can be dragged to reorder where the view allows it.

## Story time on entities

Time lives in the entity's frontmatter and is edited in the inspector's **Story Time** section:

```yaml
time:
  from: 6        # start (required to appear on the timeline)
  to: 7          # optional span end
  label: the last day
  row: Machine History   # optional row override
```
