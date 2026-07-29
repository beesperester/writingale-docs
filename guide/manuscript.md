# Manuscript Structure

The manuscript is a tree. Any entity whose type has the `manuscript` trait can contain any other — parts hold chapters, chapters can hold scenes, and the nesting is as deep as your book needs. The example book runs two levels: *Part I — The Air-Ship* → *The Room and the Plate*.

## The tree

- The canonical order of the **roots** lives in `book.yaml` under `manuscript:`.
- Each container lists its children (in order) in its own `children:` frontmatter key.
- The list column renders the tree with disclosure triangles, progress rings, story-time hints, and word counts.

Reorder by dragging, or use the context menu's **Move Into** to reparent. The inspector's **Nesting** section does the same with a picker, and **Contents** lists a container's children with quick add/create buttons ("New Sub-Chapter", "New Sub-Scene", …).

## Progress rings

Every entity with a status shows a small circular indicator, like a miniature of the goal ring:

- A **single chapter's** ring fills clockwise in its stage's color by how far along the workflow the stage sits — a quarter of the way through a four-stage workflow fills a quarter of the circle; the final stage closes it.
- A **container's** ring fills by the *average* progress of its nested chapters — one arc per chapter in that chapter's stage color, packed end to end, so a part shows both how done it is overall and the stage of each child at a glance. The ring only closes when every chapter is final.

A container's status is always derived, never set. Hovering shows the lowest stage among its descendant leaves plus a tally, and the row's `2/4 final` count means two of four leaves have reached the final stage.

## Split & merge

Two structural operations work directly from the editor:

- **Split Here** (right-click at the caret) breaks the current document into two siblings at that point.
- **Merge into previous sibling** joins a document onto the one before it.

Both retarget every reference project-wide, so annotations and links keep working.

## Material

Toggle **Material** in the inspector to mark an entity as aside material: it stays visible in the tree (dimmed, with a small "material" badge) but is excluded from export, goals, and progress. Use it for deleted scenes you can't quite delete, voice experiments, or an opening you haven't committed to. The example book's *The Old Opening (cut)* is material.

## Ordering fallbacks

Entities that aren't listed in any `children:` array fall back to their `index:` frontmatter key for ordering. This also lets externally created files slot themselves into a sensible position before you drag them where they belong.
