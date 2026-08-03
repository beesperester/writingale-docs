# Exporting

Export compiles the manuscript into **one clean file** — the version you hand to a human. Markdown by default; PDF when you want pages.

Open the export sheet with <kbd>⌘⇧E</kbd> (or **Book → Export Manuscript…**).

<img src="/screenshots/export-sheet-light.png" alt="The export sheet: contents and format options beside a live preview" class="light-only">
<img src="/screenshots/export-sheet-dark.png" alt="The export sheet: contents and format options beside a live preview" class="dark-only">

## What export does

- Walks the manuscript in order — exactly the tree you see in the list.
- Writes every link out as the entity's **current name**; links where you chose your own wording keep it.
- Places every picture where it belongs, captioned with its label. A markdown export brings the image files along next to the output; a PDF renders the pictures in place.
- Strips your private `%%` comments.
- Leaves out [material](/guide/manuscript#material).
- Warns about **broken links** — a mention of something since deleted is listed for you, never silently printed.

## Options

| Option | Effect |
|---|---|
| **Title page** | Start with the book title and author |
| **Chapter headings** | Insert each chapter's name as a heading, sized by its depth — parts largest, then chapters, then scenes |
| **Include material** | Bring aside material along after all |
| **Format** | **Markdown** writes the plain-text file; **PDF** writes paginated pages styled like the preview |

## Live preview

The sheet shows exactly what will be written, plus the total word count. When it looks right, save — the suggested destination is the book's `Export/` folder, kept separate so exported files never mix into the book itself.

## Exporting the graph and the timeline

The [graph](/guide/graph) and the [timeline](/guide/timeline) can each be saved as a **PDF** — for a wall, a planning session, or a note to a collaborator. Use the share button (the graph's control chips, the timeline's top-right corner), or **Book → Export Graph as PDF…** / **Export Timeline as PDF…** while you're looking at the view.

What you get is the *whole* picture, not the part that happened to be on screen: the graph is fitted to one page at whatever scale it takes, and the timeline keeps every column, however far it scrolls sideways. Otherwise the page is what the view shows — the kinds you've hidden stay hidden, the ordering you chose is the ordering exported. The book's title heads the page so a printed copy says where it came from.

## Why a plain file?

A single plain-text manuscript is the most portable there is: every agent, editor, and typesetting tool can read it, and standard tools can turn it into Word documents, e-books, or print layouts. The built-in PDF covers the everyday case — a readable, paginated copy — without leaving the app.
