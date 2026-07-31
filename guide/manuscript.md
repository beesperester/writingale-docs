# Manuscript Structure

The manuscript is a tree. Parts hold chapters, chapters can hold scenes, and the nesting goes as deep as your book needs. The example book runs two levels: *Part I — The Air-Ship* → *The Room and the Plate*.

## The tree

The list column shows the manuscript as a tree, with disclosure triangles, progress rings, story-time hints, and word counts. The book remembers the order — it *is* the order of your finished manuscript.

To restructure:

- **Drag** entries up, down, or into each other.
- Right-click → **Move Into** to re-parent from a menu.
- Or use the inspector's **Nesting** picker and **Contents** list, which do the same with buttons — including **New Sub-Chapter** to create a child in place. See [the inspector](/guide/inspector#nesting-progress--contents).

## Progress rings

Every chapter with a status shows a small circular indicator, like a miniature of the goal ring:

- A **single chapter's** ring fills clockwise in its stage's color by how far along the workflow the stage sits — a quarter of the way through a four-stage workflow fills a quarter of the circle; the final stage closes it.
- A **part's** ring fills by the *average* progress of its chapters — one arc per chapter in that chapter's stage color, laid end to end, so a part shows both how done it is overall and how each child is doing, at a glance. The ring only closes when every chapter is final.

A part's status is always derived from its chapters, never set by hand. Hover for the details; the row's `2/4 final` count means two of four chapters have reached the final stage.

## Split & merge

Two structural moves work right from the editor:

- **Split Here** (right-click at the cursor) breaks the current document in two at that point.
- **Merge into previous sibling** joins a document onto the one before it.

Both keep every link and annotation across the whole book pointing at the right text.

## Material

Toggle **Material** in the inspector to mark something as aside material: it stays visible in the tree (dimmed, with a small "material" badge) but is left out of export, goals, and progress. Use it for deleted scenes you can't quite delete, voice experiments, or an opening you haven't committed to. The example book's *The Old Opening (cut)* is material.

## Documents from outside

If a file arrives in the book folder from outside the app — copied in, synced, restored — it slots into a sensible position automatically, and you can drag it where it belongs.
