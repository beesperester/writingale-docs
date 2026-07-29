# Manuscript Structure

The manuscript is a tree. Any entity whose type has the `manuscript` trait can contain any other — parts hold chapters, chapters can hold scenes, and the nesting is as deep as your book needs. The example book runs two levels: *Part I — The Air-Ship* → *The Room and the Plate*.

## The tree

- The canonical order of the **roots** lives in `book.yaml` under `manuscript:`.
- Each container lists its children (in order) in its own `children:` frontmatter key.
- The list column renders the tree with disclosure triangles, status dots, story-time hints, and word counts.

Reorder by dragging, or use the context menu's **Move Into** to reparent. The inspector's **Nesting** section does the same with a picker, and **Contents** lists a container's children with quick add/create buttons ("New Sub-Chapter", "New Sub-Scene", …).

## Container progress

A container's status is derived, never set: it shows the *lowest* stage among its descendant leaves plus a tally — `2/4 final` means two of four leaves have reached the final stage. One glance at a part tells you how done it really is.

## Split & merge

Two structural operations work directly from the editor:

- **Split Here** (right-click at the caret) breaks the current document into two siblings at that point.
- **Merge into previous sibling** joins a document onto the one before it.

Both retarget every reference project-wide, so annotations and links keep working.

## Material

Toggle **Material** in the inspector to mark an entity as aside material: it stays visible in the tree (dimmed, with a small "material" badge) but is excluded from export, goals, and progress. Use it for deleted scenes you can't quite delete, voice experiments, or an opening you haven't committed to. The example book's *The Old Opening (cut)* is material.

## Ordering fallbacks

Entities that aren't listed in any `children:` array fall back to their `index:` frontmatter key for ordering. This also lets externally created files slot themselves into a sensible position before you drag them where they belong.
