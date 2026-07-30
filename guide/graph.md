# Graph View

The graph is a force-directed map of every entity and every reference between them — prose `[[links]]`, reference fields, and relationships all become edges. The manuscript acts as the graph's **spine**: chapters sit on a horizontal line in manuscript order, and the story world arranges itself around that main line.

<img src="/screenshots/graph-light.png" alt="The graph view of the example book" class="light-only">
<img src="/screenshots/graph-dark.png" alt="The graph view of the example book" class="dark-only">

## Reading the graph

- **The spine** — manuscript entities on the horizontal center line, left to right in reading order. A character whose edges all land on the right half of the spine doesn't appear until late in the book; you can see it without reading a page.
- **Nodes** are entities, in their type's color (the example book's factions are the dark red nodes — a custom hex color). Manuscript containers draw no node of their own — they appear as their group's outline and label. [Images](/guide/editor#images) are nodes too, connected to every document that embeds them.
- **Edges** are references. Consecutive manuscript entities are also connected by an implicit reading-order edge, so the spine reads as a continuous line even where chapters don't reference each other. A reference into or out of a manuscript container — which draws no node of its own — lands on the container's outline label instead, rather than disappearing. Edges that stretch far across the graph fade so the near, meaningful connections around any node stand out from the far, incidental ones — except a selected node's own edges, which always stay fully visible (see below).
- **Group outlines** trace nested manuscript containers, each labeled with the container's name — you can literally see each part wrapping its chapters. Story-world entities get the same treatment by type: characters, locations, and the rest gather into labeled clusters with their own outline, held clear of the manuscript line so they never sink into a chapter's hull. Even a lone instance of a type gets its own outline and label.

Clicking a node shows its contents in the glance panel on the right — the same inspector the editor and timeline use (<kbd>⌘4</kbd> or the toolbar's sidebar button) — with an **Open** button to jump to the document; its edges also highlight, so you can trace what it connects to at a glance. Double-clicking a node jumps straight there.

## Controls

- The **type chips** along the top toggle each entity type on and off — hide notes to see the story's social web, or show only manuscript types to see pure structure.
- **Re-layout** re-runs the force simulation; **reset** restores pan and zoom.
- Pan and zoom with the usual gestures.

## Opting types out

A type can be excluded from the graph entirely in its definition (`views: { graph: false }`) — useful for high-volume utility types that would only add noise. See [Entity Types & Traits](/guide/entity-types).
