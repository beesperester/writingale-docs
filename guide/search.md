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

## Navigation as search

Two features often replace searching entirely:

- **Referenced By** in the inspector — instant backlinks for the selected entity.
- **⌘-click** on any `[[reference]]` — jump straight to the mentioned entity, then **⌘[** to come back.
