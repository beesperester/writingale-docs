# Quick Start

This walkthrough takes you from an empty folder to an exported manuscript in about ten minutes.

## 1. Create a book

Launch Writingale. On the welcome screen, click **Create a New Book…**, give it a title and author, and choose a folder.

<img src="/screenshots/welcome-light.png" alt="The welcome screen" class="light-only">
<img src="/screenshots/welcome-dark.png" alt="The welcome screen" class="dark-only">

Writingale writes the folder for you: a `book.yaml` manifest, a `types.yaml` with the default entity types (Chapter, Character, Location, Item, Note), the type folders, and a `.gitignore`. The folder is a normal git-ready directory — nothing hidden, nothing binary.

## 2. Add a chapter and write

The main window has four columns: **sidebar** (types and views), **list** (entities of the selected type, with the manuscript tree), **editor**, and **inspector**.

1. Select **Chapters** in the sidebar.
2. Click **+** above the list to create a chapter.
3. Type. The editor styles markdown live — headings, `**bold**`, `*italic*`, lists, quotes — while keeping the file plain text. Saving is automatic.

<img src="/screenshots/editor-light.png" alt="The editor with a chapter from the example book" class="light-only">
<img src="/screenshots/editor-dark.png" alt="The editor with a chapter from the example book" class="dark-only">

## 3. Link your world together

Create a character the same way (select **Characters**, click **+**). Back in your chapter, type `[[` — an autocomplete popup lists every entity, grouped by type. Pick the character.

What lands in the file is a stable reference like `[[chr-a1b2c3d4]]`, but the editor displays it as the character's current name in accent color. Rename the character next month and every mention follows. **⌘-click** a reference to jump to it.

::: tip Display overrides
`[[uid|her brother]]` shows "her brother" instead of the entity name — useful for prose where the narrator wouldn't use a name.
:::

## 4. Fill in the structured bits

With a chapter selected, the inspector on the right offers what the chapter's type supports: completion **status** (outline → draft → revision → final), **story time** (day 0 is where your story starts; negative numbers are before it), **POV**, **cast**, and **locations**.

These fields are what power the [graph](/guide/graph), the [timeline](/guide/timeline), and each character's [journey](/guide/journeys) — the more you fill in, the more the views can tell you.

## 5. Set a goal

Click the ring in the sidebar header to set a writing goal — e.g. *at least 60,000 words by December 31* — and to see your writing history: words today, daily average, best day, and the last week at a glance.

## 6. Export

Press <kbd>⌘⇧E</kbd> (or **Book → Export Manuscript…**). The export sheet shows a live preview of the compiled manuscript: chapters in manuscript order, headings tracking nesting depth, `[[uid]]` references replaced with current names, `%%` comment lines stripped. Save it as a single clean markdown file — ready for Pandoc, an agent, or a typesetter.

## Where to go next

- [Books & Entities](/guide/concepts) — the mental model behind everything
- [The Editor](/guide/editor) — markup, writing modes, and the split editor
- [Manuscript Structure](/guide/manuscript) — parts, chapters, scenes, and material
- [Entity Types & Traits](/guide/entity-types) — make the app fit your book
