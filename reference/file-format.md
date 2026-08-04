# File Format

Complete reference for the on-disk format. Everything is YAML and markdown; nothing is binary. The examples come from the bundled example book, *The War of the Worlds* (after H. G. Wells's 1898 story).

## Book folder layout

```
MyBook/
  book.yaml           # manifest
  types.yaml          # entity type definitions
  Chapters/…          # one folder per type (configurable)
  Characters/…
  Notes/…
  Images/…            # image entities + their binaries (content-hash names)
  …
  .writingale/        # local app state (stats.json, workspace.json) — gitignored
  Export/             # ignored by the entity scanner
```

## `book.yaml`

```yaml
title: The War of the Worlds
author: after H. G. Wells (1898)
timeUnit: day            # the unit story time is counted in
goal:                    # optional book-wide writing goal
  comparator: at-least   # about | at-least | at-most
  count: 15000
  unit: words            # words | characters
  deadline: 2026-12-31   # optional, yyyy-MM-dd
manuscript:              # canonical order of the manuscript roots
- chp-aa000001
- chp-aa000002
- chp-aa000003
```

Decoding is lenient: unknown comparators or units fall back to defaults, and a missing manifest never prevents the book from opening.

## `types.yaml`

```yaml
version: 1
types:
  - id: chapter
    name: Chapter
    plural: Chapters
    prefix: chp          # 2–6 lowercase letters
    folder: Chapters
    section: Manuscript  # sidebar section
    icon: book.closed    # SF Symbol
    color: accent        # named color or "#RRGGBB"
    views:               # optional per-view opt-out
      graph: true
      timeline: true
    traits:
      - manuscript
      - timeline         # bare trait…
      - status:          # …or trait with configuration
          stages:
            - { id: outline,  name: Outline,  color: gray }
            - { id: draft,    name: Draft,    color: orange }
            - { id: revision, name: Revision, color: yellow }
            - { id: final,    name: Final,    color: green }
    fields:
      - { key: pov, label: POV, kind: reference, cardinality: one,
          types: [character], role: pov }   # types may list several
    template: ""         # starter body for new entities
```

### Traits

| Trait | Payload | Behavior |
|---|---|---|
| `manuscript` | — | Member of the manuscript tree; nests, exports, counts toward goals |
| `status` | `stages: [{id, name, color}]` | Completion workflow |
| `timeline` | optional `row: <name>` | Story-time editing + timeline card, with an optional default named row |
| `relationships` | — | Typed links with notes |
| `annotator` | — | Can attach to documents/passages |
| `journey` | — | Appearances inferred across the manuscript |
| `image` | — | Labels a stored image asset (`file` key); embeddable with `![[uid]]` |

### Fields

`kind: text | number | list | reference`. Reference fields take `cardinality: one | many`, `types: [typeId, …]`, and optionally `role: pov` (marks the point-of-view reference used by journeys and the timeline).

Reserved keys that cannot be field keys: `uid`, `type`, `name`, `created`, `children`, `index`, `status`, `goal`, `material`, `file`, `time`, `relationships`, `annotations`.

Structural problems in `types.yaml` are reported as warnings — never fatal.

## Entity files

One markdown file per entity: YAML frontmatter, then the body.

```markdown
---
uid: chp-bb000003          # <prefix>-<8 hex>, immutable
type: chapter              # authoritative type id
name: The Exodus from London
created: 2026-08-04        # yyyy-MM-dd
status: revision           # stage id (status trait)
goal: 1800                 # per-entity word target
pov: chr-cc000002          # custom field (reference)
time:                      # timeline trait
  from: 4
  to: 6
  label: the exodus
  row: The Brother         # optional named timeline row
---

My brother was in [[loc-dd000005]] for all of it, and this chapter is
his, told to me afterwards over a great many evenings…
```

### Frontmatter keys

| Key | Meaning |
|---|---|
| `uid` | Stable identifier, `<2–6 lowercase letters>-<8 hex digits>`. Never changes. |
| `type` | Type id (the uid prefix is only a hint; `type` wins). |
| `name` | Display name — safe to change at any time. |
| `created` | Creation date, `yyyy-MM-dd`. |
| `children` | Ordered child uids (manuscript containers). |
| `index` | Fallback ordering integer for entities not placed in any `children` list. |
| `status` | Stage id. Unknown values are tolerated. |
| `goal` | Per-entity word target (integer). |
| `material` | `true` marks aside material — in the tree, out of export/goals/progress. |
| `file` | Project-relative path of the stored asset an image entity labels, e.g. `Images/b5a2cb9e3792d21f.png` (named by content hash). |
| `time` | `{from, to, label, row}` — numbers in the book's time unit; 0 = book start, negatives before. |
| `relationships` | `[{to, kind, note?}]` |
| `annotations` | `[{target, quote?, stale?}]` |
| *custom fields* | Whatever the type's schema defines, in schema order. |
| *anything else* | **Preserved verbatim** in original order — your own metadata is safe. |

Trait payload keys are parsed whenever present, regardless of whether the type currently enables the trait — toggling a trait never destroys data. Empty values are omitted on save.

### Body

Plain markdown. Three extensions:

- `[[uid]]` and `[[uid|display text]]` wiki references.
- `![[uid]]` image embeds — the referenced image entity's picture in place; exports as `![name](Images/…)` (a `|display` override changes the alt text). For image entities the plain `[[uid]]` form behaves identically — referencing an image is embedding it.
- `%%` comment lines — visible (dimmed) in the editor, stripped on export.

## `.writingale/stats.json`

```json
{ "days": [ { "date": "2026-07-28", "wordsAdded": 1240 } ] }
```

Local, per-book writing history. Delta-based and never decreasing. Gitignored by the generated `.gitignore`.

## `.writingale/workspace.json`

Which documents you had open, in which panes, and how you had sized the splits — restored when you reopen the book. Local and gitignored like the stats; deleting it simply starts you with one empty pane. Nothing about the book itself lives here, so it never matters to anyone you share the folder with.
