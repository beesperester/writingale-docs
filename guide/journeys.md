# Journeys

A journey is the answer to "where does this character actually appear?" — inferred from the manuscript, never maintained by hand.

For every entity whose type has the `journey` trait, Writingale scans the manuscript for appearances: prose references, cast lists, POV fields, item ownership. The result is an ordered itinerary through the book.

![A character's journey in the inspector](/screenshots/journey.png)

## What a journey entry shows

Each stop lists:

- the manuscript entity (chapter or scene) and its **position** in reading order,
- the **story time** of that appearance ("Ledger-day, morning (day 0)"),
- a **POV badge** when the character is the point-of-view of that chapter or scene (via the field marked `role: pov`),
- a **"mentioned" badge** when the entity is only referenced in prose rather than present in structured fields,
- the **co-referenced entities** of that stop, grouped by type — who else is in the scene, where it happens, what objects are present.

## Where journeys appear

- The **inspector**'s Journey section (shown above) for the selected entity.
- The **list column** summarizes it — "appears in 11 entries" under each character.
- The **timeline** draws per-entity journey lanes along the time axis.

## Why it matters

Because journeys are derived, they are always true to the current text. If you cut a chapter, the journey updates. If two characters never actually share a scene — despite your outline swearing they do — the journey is where you find out.
