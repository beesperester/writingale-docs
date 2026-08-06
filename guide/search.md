# Search & Filtering

## Filtering the list

The list column has an inline filter bar (the filter button above the list). Type to narrow the visible entities, and use the **scope chip** to say where to look:

| Scope | Matches |
|---|---|
| **Anywhere** | All of the below |
| **Name** | Entity names only |
| **Headings** | Markdown headings in bodies |
| **Body** | Body prose |
| **Comments** | `%%` comment lines |
| **Annotations** | Annotation quotes and their targets |
| **Fields** | Custom field values |

Scoped search is how you ask questions like "where did I leave a `%% TODO` comment" or "which entities mention *trap street* in a heading" without leaving the keyboard.

## Find in the current document

<kbd>⌘F</kbd> opens the standard find bar in the editor; <kbd>⌘⌥F</kbd> adds replace. This is per-document — use the list filter for project-wide questions.

## Finding things in the graph and the timeline

<kbd>⌘F</kbd> means "find in what I'm looking at". With a [graph](/guide/graph) or [timeline](/guide/timeline) tab in front, it opens that view's own search field instead of the editor's find bar — the same key, the same Edit → Find… menu item, the same toolbar button.

<img src="/screenshots/view-search-light.png" alt="The timeline's search bar: a query, a match counter, and stepping chevrons" class="light-only">
<img src="/screenshots/view-search-dark.png" alt="The timeline's search bar: a query, a match counter, and stepping chevrons" class="dark-only">

What it does is **highlight, not filter**. Everything that matches keeps its place and gains a coloured ring — nodes in the graph, cards and part bands on the timeline — while everything else fades back. A character you searched for stays surrounded by the chapters they appear in; you can see *where* the answer is, not just what it is.

Beside the field, **"3 of 12"** counts the matches. The **⌃** and **⌄** chevrons — or <kbd>Return</kbd> — step through them in reading order and wrap around at the ends. Stepping brings each match to the middle of the view: the graph pans to it, the timeline scrolls to its row. Nothing extra is drawn around the one you're on — bringing it into view *is* the answer.

Press <kbd>⌘F</kbd> again to jump back into a field that's already open; <kbd>Esc</kbd> or the **✕** closes it and restores the view. An empty field dims nothing, and exported PDFs never carry the highlighting.

## Navigation as search

Two features often replace searching entirely:

- **Referenced By** in the inspector — instant backlinks for the selected entity.
- **⌘-click** on any `[[reference]]` — jump straight to the mentioned entity, then **⌘[** to come back.
