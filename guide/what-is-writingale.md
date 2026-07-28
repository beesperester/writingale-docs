# What is Writingale?

Writingale is a native macOS app for writing books on **plain markdown files**.

Everything in a book — chapters, characters, locations, items, notes — is an **entity**: a single markdown file with a small YAML frontmatter block. Entities reference each other with stable `[[uid]]` links, so names can change at any point in the process without breaking anything. Nothing is baked in until you export, when uids are replaced with the entities' current names.

<img src="/screenshots/welcome-light.png" alt="The welcome screen" class="light-only">
<img src="/screenshots/welcome-dark.png" alt="The welcome screen" class="dark-only">

## Why plain files?

A Writingale book is just a folder:

```
MyBook/
  book.yaml               # title, author, time unit, manuscript order, goal
  types.yaml              # what kinds of entities this book is made of
  Chapters/01-the-room-and-the-plate.md
  Characters/vashti.md
  Locations/the-air-ship.md
  Items/the-book-of-the-machine.md
  Notes/why-the-machine-stops.md
```

That buys you things a proprietary format can't:

- **No lock-in.** Every file opens in any text editor, today and in thirty years.
- **Version control.** A book is a perfectly ordinary git repository.
- **External tools welcome.** Edit files in Obsidian or vim while the book is open — Writingale watches the folder and reloads automatically.
- **Greppable.** Your book is searchable with every tool you already know.

## Structured, not just stored

Because chapters carry structured data — cast, locations, story time, point of view — the app can work *backwards* too. Each character's [journey](/guide/journeys) through the story (where they are, when, with whom, carrying what) is **inferred from the chapters**, not maintained by hand. The [graph](/guide/graph) and [timeline](/guide/timeline) views are drawn from the same data.

## Made of configurable parts

The five classic types — Chapter, Character, Location, Item, Note — are just the bundled default template. Every book defines its own kinds of entities in `types.yaml`: a type combines built-in behavior **traits** (manuscript, status, timeline, relationships, annotator, journey) with custom fields, an icon, a color, and a folder. See [Entity Types & Traits](/guide/entity-types).

## The example book

The repository ships with an example project, *The Machine Stops* — an abridged retelling of E. M. Forster's 1909 story of a buried, machine-fed humanity and the one man who climbs back to the surface. It exercises every feature: nesting (parts → chapters), a custom type (Faction), goals, story time with negative dates, annotations, relationships, and aside material. Open `ExampleBook/` from the welcome screen to explore it; most screenshots in this documentation show it.

## Next steps

- [Install and build Writingale](/guide/installation)
- [Create your first book](/guide/quick-start)
- [Understand books and entities](/guide/concepts)
