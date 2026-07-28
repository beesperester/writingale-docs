# Graph View

The graph is a force-directed map of every entity and every reference between them — prose `[[links]]`, reference fields, and relationships all become edges. The manuscript acts as the graph's **spine**: chapters sit on a horizontal line in manuscript order, and the story world arranges itself around that main line.

![The graph view of the example book](/screenshots/graph.png)

## Reading the graph

- **The spine** — manuscript entities on the horizontal center line, left to right in reading order. A character whose edges all land on the right half of the spine doesn't appear until late in the book; you can see it without reading a page.
- **Nodes** are entities, in their type's color (the example book's factions are the dark red nodes — a custom hex color).
- **Edges** are references. Hover a node for a card with its reference count; click **Open** to jump to it.
- **Group outlines** trace nested manuscript containers — you can literally see each part wrapping its chapters.

## Controls

- The **type chips** along the top toggle each entity type on and off — hide notes to see the story's social web, or show only manuscript types to see pure structure.
- **Re-layout** re-runs the force simulation; **reset** restores pan and zoom.
- Pan and zoom with the usual gestures.

## Opting types out

A type can be excluded from the graph entirely in its definition (`views: { graph: false }`) — useful for high-volume utility types that would only add noise. See [Entity Types & Traits](/guide/entity-types).
