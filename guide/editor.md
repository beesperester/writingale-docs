# The Editor

The editor is where you write. It styles your text in place as you type — headings scale, emphasis renders, links show as names — while the file underneath stays plain text you could open anywhere. A slim title bar above the text always names the document you're in, and marks unsaved changes with a `*` after the name.

<img src="/screenshots/editor-light.png" alt="The editor showing a chapter from the example book" class="light-only">
<img src="/screenshots/editor-dark.png" alt="The editor showing a chapter from the example book" class="dark-only">

## Styling as you type

Formatting uses lightweight marks that stay visible (dimmed) while the styled text reads like the finished page:

| You type | You get |
|---|---|
| `# … ######` | Headings, scaled by level |
| `**bold**` | **bold** |
| `*italic*` or `_italic_` | *italic* |
| `~~strikethrough~~` | ~~strikethrough~~ |
| `> quote` | a quotation block, set off by its own indent |
| `- item` / `1. item` | bulleted / numbered lists |
| `%% note to self` | a private comment — dimmed here, never exported |

You don't have to type the marks. The **format buttons above the editor** style whatever is selected — headings, bold, italic, strikethrough, code, lists, quote, and comment, one click each. The **Markup menu** applies the same styles — Bold <kbd>⌘B</kbd>, Italic <kbd>⌘I</kbd>, Comment <kbd>⌘/</kbd> — and the right-click menu carries a Format submenu too.

### Three views of your text

The switcher in the toolbar shows which view you're in and flips between them: **live styling** (the pencil — where you write), a clean **reading preview** (the eye), and the **raw text** (the brackets). The view belongs to the editor you're working in, so with the [split editor](#split-editor) open you can read one document while writing in the other. Every launch starts in live styling.

### Preview

<img src="/screenshots/editor-preview-light.png" alt="Preview: the chapter rendered clean, without formatting marks" class="light-only">
<img src="/screenshots/editor-preview-dark.png" alt="Preview: the chapter rendered clean, without formatting marks" class="dark-only">

**View → Preview** <kbd>⌘⇧P</kbd> — or the eye in the switcher — shows the document as it will read on the page: the formatting marks disappear, links read as plain names, and pictures sit in place. It's a reading view — the text can't be edited until you switch back (press <kbd>⌘⇧P</kbd> again).

### Raw markdown mode

<img src="/screenshots/editor-raw-light.png" alt="Raw markdown mode: no styling, links shown as their underlying tokens" class="light-only">
<img src="/screenshots/editor-raw-dark.png" alt="Raw markdown mode: no styling, links shown as their underlying tokens" class="dark-only">

**View → Raw Markdown** <kbd>⌘⇧R</kbd> — or the brackets in the switcher — turns the live styling off and shows the text exactly as it sits in the file — including links as their underlying tokens (colored; red when pointing at something deleted). Everything stays editable; use it when you want to see or work on the plain text itself.

### Font & line height

The document font, size, and line height are set in **Settings** <kbd>⌘,</kbd>, with a live preview. The default is the system serif at 15.5 pt. Your choice follows your story everywhere it's read: the editor, [Preview](#preview), glance panels, and the [export](/guide/export) preview and PDF.

## Links

- Type `[[` to open the popup — everything in your book, grouped by kind. Pick one and the mention appears as its name in the accent color.
- Rename the entity any time; every mention follows. Click a mention to peek at what's underneath; press delete once to remove the whole link.
- Want your own wording? A link can display any text — "her brother" — while still pointing at the right character.
- **⌘-click** a link to jump to what it names; **⌘[** and **⌘]** walk back and forward like a browser.
- Right-click → **Insert Reference** is the menu-driven alternative to typing `[[`.
- Or **drag one in from the list**: switch the sidebar to Characters (or any other kind — your document stays open), then drag a name from the list into your text. The cursor follows the drag so you can see exactly where the mention will land; drop it and it appears as the name, linked like any other mention.

## Quick insert

Press <kbd>⌘K</kbd> and a search field opens over the window. Type a few letters and it offers matching people, places, chapters, notes — press <kbd>Return</kbd> and the mention lands at your cursor. It's the fastest way in when you already know who you mean.

<img src="/screenshots/quick-insert-light.png" alt="Quick insert offering matching entities" class="light-only">
<img src="/screenshots/quick-insert-dark.png" alt="Quick insert offering matching entities" class="dark-only">

Narrow the search to one kind by starting with its name and a colon: **`Characters: vash`** searches only characters. You don't have to type the whole word — `char: vash` works too, and the palette offers the prefixes for you: with the field empty it lists every kind, and picking one fills the prefix in.

The same field runs commands. Type `bold`, `heading`, `export`, `timeline` — anything you'd otherwise hunt for in a menu — and the matching action appears, with a note of which menu it also lives under. Which actions are offered depends on where you are: the formatting commands only show up when there's text to format.

Away from the editor — in the [graph](/guide/graph) or the [timeline](/guide/timeline) — the same shortcut becomes a document jumper: type a name, press <kbd>Return</kbd>, and that document opens.

<kbd>Esc</kbd>, or a click outside, closes the field without doing anything.

## Images

Drag a picture into the editor and it lands where you drop it:

- The picture is **copied into the book**, so the book folder stays complete and portable. Dropping the same picture twice never stores it twice.
- The picture becomes an entity of its own — its name is the caption-like **label** you'll see wherever it appears, editable like any name.
- In the text, the picture shows right in place. Like other links, it's one unit: click to see what's underneath, delete once to remove.
- To place an already-imported picture, type `[[` and pick it, like linking anything else.
- A picture entity can carry its own notes — sources, art direction, caption drafts — which stay with the picture and never leak into your chapters.
- Pictures appear in the [graph](/guide/graph), connected to every document that shows them.
- On [export](/guide/export), pictures travel with the manuscript; a PDF renders them in place.

To swap a picture everywhere at once, replace it on the picture's own entity in the [inspector](/guide/inspector#image) — the layout, label, and placements all stay.

## Writing modes

All in the **View menu**:

- **Highlight** — dim everything except what you're working on: the current *line*, *sentence*, or *paragraph*. Below: sentence focus.
- **Fixed Scrolling** — typewriter mode: keep the line you're typing pinned to the *top*, *center*, or *bottom* of the window instead of drifting down the screen.
- **Hide Interface** <kbd>⌘.</kbd> — distraction-free writing: a centered column of text and a floating word counter, nothing else. Press it again to come back.

<img src="/screenshots/editor-hidden-light.png" alt="Hide Interface: a centered column of text and a floating word counter" class="light-only">
<img src="/screenshots/editor-hidden-dark.png" alt="Hide Interface: a centered column of text and a floating word counter" class="dark-only">

<img src="/screenshots/editor-focus-light.png" alt="Sentence focus: the sentence at the cursor is dark, everything else dimmed" class="light-only">
<img src="/screenshots/editor-focus-dark.png" alt="Sentence focus: the sentence at the cursor is dark, everything else dimmed" class="dark-only">

## Three ways to lay out the editor

The switcher in the toolbar — and the matching group in the **View menu** — offers three layouts. You're always in exactly one of them, and the switcher shows which:

- **Single editor** <kbd>⌘⌥1</kbd> — one document at a time. The everyday view.
- **Split editor** <kbd>⌘⌥2</kbd> — two documents side by side.
- **Continuous scroll** <kbd>⌘⌥3</kbd> — the whole manuscript as one flowing text.

### Split editor

<img src="/screenshots/editor-split-light.png" alt="The split editor: two documents side by side" class="light-only">
<img src="/screenshots/editor-split-dark.png" alt="The split editor: two documents side by side" class="dark-only">

Each pane shows its own document — write the chapter on the left while its outline or a research note sits on the right. The pane you're working in shows its title in the accent color, and the list column follows it. Leaving this layout closes the second pane.

### Continuous scroll

Your whole manuscript becomes one flowing view, in reading order. A labeled divider marks where each chapter begins, so the boundaries stay visible while the text reads as one piece — and everything stays editable right there. As you scroll, the chapter currently on screen is highlighted in the list; click a chapter in the list to jump the view to it.

## Adding documents from your Mac

Drop a `.md` or `.txt` file into the editor to bring it into the book. Writingale asks what it should become — a chapter, a note, whatever type fits — creates it, and inserts a link to it right where you dropped the file. You can also drop files on the list or the sidebar; see [Manuscript Structure](/guide/manuscript#documents-from-outside).

## Find

<kbd>⌘F</kbd> opens Find, <kbd>⌘⌥F</kbd> Find & Replace — scoped to the current document. For questions about the whole book, see [Search & Filtering](/guide/search).

## Saving

You decide when your work goes to disk: **File → Save** <kbd>⌘S</kbd> saves the document you're in, **File → Save All** <kbd>⌥⌘S</kbd> saves everything at once. Until then, edits live safely in the app and are clearly marked — a `*` after the document's name in the title bar, *Edited* in the status bar, and a small dot next to changed documents in the lists (a category in the sidebar shows the dot when anything inside it has unsaved changes).

If you quit or close the book while something is unsaved, Writingale asks whether to save it all, discard, or stay.

The status bar also shows the word count — and the word count of just the selection while text is selected.
