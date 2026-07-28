# The Editor

The editor shows the markdown source of the selected entity, styled in place — the file stays plain text, but headings scale, emphasis renders, and references become readable names.

<img src="/screenshots/editor-light.png" alt="The editor showing a chapter from the example book" class="light-only">
<img src="/screenshots/editor-dark.png" alt="The editor showing a chapter from the example book" class="dark-only">

## Markdown styling

Writingale styles as you type, Obsidian-style: the markers stay visible (dimmed), the styled text reads like the finished page.

| Syntax | Result |
|---|---|
| `# … ######` | Headings H1–H6, scaled by level |
| `**bold**` | **bold** |
| `*italic*` or `_italic_` | *italic* |
| `~~strikethrough~~` | ~~strikethrough~~ |
| `` `inline code` `` | `inline code` |
| `> quote` | blockquote |
| `- item` / `1. item` | bulleted / numbered lists |
| `%% comment` | a comment line — dimmed in the editor, stripped from export |

Formatting lives in the **Markup menu** (Ulysses-style — no toolbar strip): Bold <kbd>⌘B</kbd>, Italic <kbd>⌘I</kbd>, Comment <kbd>⌘/</kbd>, headings, lists, quote, strikethrough, inline code. The right-click menu carries a Format submenu too.

### Raw markdown mode

**View → Raw Markdown** <kbd>⌘⇧R</kbd> turns the live styling off: no scaled headings, no dimmed markers, and references stay as their raw `[[uid]]` tokens (accent-colored; red when broken). The text remains fully editable — use it to inspect exactly what's on disk or to work on the markup itself.

### Font & line height

The document font family, size, and line height are app-wide preferences in **Settings** <kbd>⌘,</kbd>, with a live preview. The default is the system serif at 15.5 pt with 1.25× line height.

## References

- Type `[[` to open the **autocomplete popup**, grouped by entity type.
- `[[uid]]` tokens render collapsed as the entity's current name in accent color; click one to reveal the raw token. Tokens are atomic for the caret — one press of delete removes the whole reference.
- `[[uid|display text]]` keeps your own wording while still linking.
- **⌘-click** a reference to navigate to that entity (⌘-hover shows the pointing hand). **⌘[** and **⌘]** walk your navigation history like a browser.
- Right-click → **Insert Reference** for a menu-driven alternative.

## Writing modes

All in the **View menu**:

- **Highlight** — dim everything except the current *line*, *sentence*, or *paragraph*.
- **Fixed Scrolling** — typewriter mode: keep the caret line pinned to the *top*, *center*, or *bottom* of the view.
- **Hide Interface** <kbd>⌘.</kbd> — distraction-free writing: a centered column with a floating word counter, nothing else.

## Split editor

**Toggle Second Editor** <kbd>⌘⌥3</kbd> opens a second pane. Each pane has its own selection; the list follows whichever pane is focused. Perfect for writing a chapter while its outline or a research note sits alongside.

## Find

<kbd>⌘F</kbd> opens Find, <kbd>⌘⌥F</kbd> Find & Replace — the standard macOS find bar, scoped to the current document. For project-wide search, see [Search & Filtering](/guide/search).

## Saving

Saving is automatic (debounced, under a second after you stop typing). The status bar shows *Editing… / Saved*, the current word count, and the word count of the selection while text is selected.
