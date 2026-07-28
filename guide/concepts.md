# Books & Entities

Two ideas carry all of Writingale: a **book is a folder**, and **everything in it is an entity**.

## The book folder

A book folder contains two YAML files and any number of markdown files:

| File | Purpose |
|---|---|
| `book.yaml` | Title, author, time unit, the canonical manuscript order, and an optional writing goal |
| `types.yaml` | The entity type definitions for this book |
| `*/*.md` | One file per entity, organized into folders by type |
| `.writingale/` | Local app state (writing statistics); safe to gitignore |
| `Export/` | Ignored by the entity scanner — a safe place for exported manuscripts |

Writingale watches the folder. Edit a file in another editor and the app reloads it; the **Reload from Disk** command (<kbd>⌘R</kbd>) forces a refresh.

## Entities

An entity is one markdown file: YAML frontmatter on top, prose below.

```markdown
---
uid: chr-a1a1a1a1
type: character
name: Mirelle Voss
created: 2026-07-22
traits:
- exacting
- debt-shaped
relationships:
- to: chr-c2c2c2c2
  kind: creditor
  note: He held her father's debt, then hers.
items:
- itm-e0e0e0e0
---

## Profile

Master engraver and proof-corrector of [[loc-b7b7b7b7]], the last
independent map shop in [[loc-a6a6a6a6]].
```

Three keys matter everywhere:

- **`uid`** — a stable identifier (`prefix-8hexdigits`, e.g. `chr-a1a1a1a1`). It never changes; everything else can.
- **`type`** — which entity type this is, deciding its traits, fields, icon, and where it appears.
- **`name`** — the display name. Renaming is always safe because references point at the uid.

Everything else in the frontmatter comes from the type's traits and custom fields — and unknown keys you add yourself are preserved verbatim, so your own metadata is welcome.

## References

Entities link to each other in two ways:

1. **In prose**: `[[uid]]` wiki links, rendered in the editor as the entity's current name; `[[uid|display text]]` overrides the label.
2. **In frontmatter**: reference fields like a chapter's `cast:` or an item's `owner:` hold uids.

Both kinds are indexed. The inspector's **Referenced By** section lists every entity that points at the current one, and the [graph](/guide/graph) draws the whole web.

::: info Names are resolved at the edges
Files on disk always contain uids, never names. The editor *displays* names; the exporter *substitutes* them. That's why nothing ever breaks when you rename.
:::

## Where entities live in the UI

<img src="/screenshots/character-light.png" alt="A character with relationships, traits, and items in the inspector" class="light-only">
<img src="/screenshots/character-dark.png" alt="A character with relationships, traits, and items in the inspector" class="dark-only">

- The **sidebar** groups types into sections (Manuscript, Story World by default) and lists the derived **views** (Graph, Timeline).
- The **list** shows the entities of the selected type — for manuscript types, as a nested tree with status dots and word counts.
- The **editor** shows the entity's markdown body.
- The **inspector** shows the structured side: identity, status, goal, time, relationships, fields, backlinks, journey.

## Load issues are never fatal

If a file has broken frontmatter or `types.yaml` has a problem, Writingale loads everything it can and reports the issues instead of refusing to open the book. Files it cannot classify appear as "Unrecognized" and stay untouched.
