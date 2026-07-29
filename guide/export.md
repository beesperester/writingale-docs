# Exporting

Export compiles the manuscript tree into **one clean file** — the version you hand to a human. Markdown by default; PDF when you want pages.

Open the export sheet with <kbd>⌘⇧E</kbd> (or **Book → Export Manuscript…**).

## What export does

- Walks the manuscript in canonical order (the tree you see in the list).
- Replaces every `[[uid]]` with the entity's **current name**; `[[uid|display text]]` keeps your override.
- Turns every `![[uid]]` image embed into a standard markdown image, `![label](Images/…)`, with the image entity's name as the alt text. A markdown export copies the embedded image files next to the output (keeping their `Images/…` paths) so the links resolve; a PDF renders the pictures in place.
- Strips `%%` comment lines (code fences are respected — a `%%` inside a fence survives).
- Skips [material](/guide/manuscript#material) entities.
- Warns about **unresolved references** — a `[[uid]]` pointing at a deleted entity is listed, not silently printed.

## Options

| Option | Effect |
|---|---|
| **Title page** | Prepend the book title and author |
| **Chapter headings** | Insert each entity's name as a heading, its level tracking nesting depth (parts become `#`, chapters `##`, scenes `###`, …) |
| **Include material** | Bring aside material along after all |
| **Format** | **Markdown** writes the plain-text source; **PDF** writes paginated pages styled like the preview |

## Live preview

The sheet shows a rendered preview of exactly what will be written, plus the total word count. When it looks right, save — the standard panel suggests the book's `Export/` folder, which the entity scanner ignores, so exported files never pollute your book.

## Why markdown out?

A single markdown file is the most portable manuscript there is: Pandoc turns it into DOCX, EPUB, or print-ready layouts; agents and editors can read it as-is; and it diffs cleanly against your last export. The built-in PDF export covers the everyday case — a readable, paginated copy — without leaving the app.
