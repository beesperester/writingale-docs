# The Inspector

The inspector (<kbd>⌘4</kbd>, or the toolbar button) is where the selected entity's **facts** live — everything about a chapter or character that isn't its prose. It's the same panel behind the editor, the graph's glance panel, and the timeline. It starts closed; open it when you need it, and it follows whichever [pane](/guide/editor#splitting) is focused.

What the inspector shows depends on what's selected: a chapter offers completion and story time, a character offers relationships and a journey, your custom faction offers its own fields. Every screenshot below is a real close-up from the bundled example book, *The War of the Worlds*.

## Overview

A row of small chips sits at the top — status, word count against any goal, how many things point here and how many this points at, attached notes, story time. Each chip jumps straight to its section, so you can check one fact without scrolling past everything.

<img src="/screenshots/inspector-overview-light.png" alt="The overview chips at the top of the inspector" class="light-only">
<img src="/screenshots/inspector-overview-dark.png" alt="The overview chips at the top of the inspector" class="dark-only">

*"The Exodus from London": in revision, 527 of 1,800 words, seven things point here and it points at six, no notes, set on days 4–6.*

## Identity

<img src="/screenshots/inspector-identity-light.png" alt="The Identity section: name, type, reference, creation date" class="light-only">
<img src="/screenshots/inspector-identity-dark.png" alt="The Identity section: name, type, reference, creation date" class="dark-only">

Every entity has this section. **Name** is editable right here — and renaming is always safe, because every mention in the book follows automatically. **Type** says what kind of thing this is. **Reference** is the entity's link token: select it, copy, and paste into any document to link to this entity from there. **Created** shows when it was made.

## Image

<img src="/screenshots/inspector-image-light.png" alt="The Image section with a preview, Replace button, and stored file name" class="light-only">
<img src="/screenshots/inspector-image-dark.png" alt="The Image section with a preview, Replace button, and stored file name" class="dark-only">

For picture entities: a preview of the stored image. To swap the picture, click **Replace…** or simply **drop a new image file onto the preview** — a colored outline appears while you hover. Everywhere the picture is embedded updates instantly, and its name, notes, and links all survive; only the picture itself changes. See [Images](/guide/editor#images) for how embedding works from the writing side.

## Completion

<img src="/screenshots/inspector-completion-light.png" alt="The Completion section's status picker" class="light-only">
<img src="/screenshots/inspector-completion-dark.png" alt="The Completion section's status picker" class="dark-only">

Where you move a chapter through your workflow: outline → draft → revision → final by default, though the stages are yours to rename in the [type editor](/guide/entity-types). The stage shows as a colored progress ring next to the chapter everywhere in the app.

Parts don't have their own Completion — their standing is always derived from their chapters. See **Progress** below.

## Writing Goal & Material

<img src="/screenshots/inspector-goal-light.png" alt="The Writing Goal section with a word target, progress ring, and Material toggle" class="light-only">
<img src="/screenshots/inspector-goal-dark.png" alt="The Writing Goal section with a word target, progress ring, and Material toggle" class="dark-only">

**Target words** gives this one chapter its own word goal, separate from the book-wide goal. A small ring fills as you write, and the list column shows the same progress under the chapter's name. See [Goals & Statistics](/guide/goals).

**Material** marks the entity as aside material: it keeps its place in the manuscript tree but is left out of export, goals, and progress — for deleted scenes you're not ready to delete, voice tests, cut openings. Above: *The Martian Preface (cut)*, the example book's cut opening, with its own 400-word target — it still tracks its own progress, but adds nothing to the book's counts. See [Manuscript Structure § Material](/guide/manuscript#material).

## Relationships

<img src="/screenshots/inspector-relationships-light.png" alt="The Relationships section with a mother–son relationship" class="light-only">
<img src="/screenshots/inspector-relationships-dark.png" alt="The Relationships section with a mother–son relationship" class="dark-only">

Who is what to whom. Each relationship names a target, a **kind** in your own words — "sister", "rival", "creditor", nothing is prescribed — and an optional note. **Add Relationship** lists every possible partner (relationships connect things of the same kind: characters to characters, factions to factions). Above, the narrator's entry for his brother: *brother*, "In London through the exodus; they do not meet again until it is over."

A relationship is one entry on one side — the narrator's "brother" doesn't automatically write the answering entry on his brother — so record it where it matters, or on both sides as the book needs. Relationships also draw as connecting lines in the [graph](/guide/graph).

## Story Time

<img src="/screenshots/inspector-storytime-light.png" alt="The Story Time section with a negative position, before the book opens" class="light-only">
<img src="/screenshots/inspector-storytime-dark.png" alt="The Story Time section with a negative position, before the book opens" class="dark-only">

Where the entity sits in your story's chronology, counted in the unit your book uses (days here — months or years work the same). **0 is the moment your book begins, and negative numbers are backstory**: above, *The gas jets on Mars* were recorded sixty days before page one. **From** places it (and is all the timeline needs); **To** turns it into a span; **Label** is your own description of the moment; **Row** picks which strip of the [timeline](/guide/timeline) it renders in.

## Nesting, Progress & Contents

<img src="/screenshots/inspector-nesting-light.png" alt="The Nesting picker, derived Progress, and Contents list of a part" class="light-only">
<img src="/screenshots/inspector-nesting-dark.png" alt="The Nesting picker, derived Progress, and Contents list of a part" class="dark-only">

Three sections about the entity's place in the manuscript:

- **Nesting** — the **Inside** picker moves this entity into a part or chapter, or to the top level. Same result as dragging it in the list.
- **Progress** — appears once something is nested here: a ring plus a tally, derived from the least-finished thing inside. Above, *Part I* reads "Final · 2 of 2 final" — its two counting chapters are done, and the cut opening is [material](/guide/manuscript#material), so it doesn't count.
- **Contents** — the children, in order: reorder with the arrows, remove with **−** (which moves the child back to the top level — nothing is deleted), attach something that already exists with **Add Entity**, or create a fresh child in place with **New Sub-Chapter**.

See [Manuscript Structure](/guide/manuscript) for the tree as a whole.

## Annotates

<img src="/screenshots/inspector-annotates-light.png" alt="The Annotates section of a note, with a stale quoted passage" class="light-only">
<img src="/screenshots/inspector-annotates-dark.png" alt="The Annotates section of a note, with a stale quoted passage" class="dark-only">

On a note: everything the note is pinned to — a whole document, or an exact quoted passage, shown underneath. If the quoted passage no longer exists in the target, the pin is flagged **stale** in red rather than silently discarded; above, the example book's *Note on the cut preface* deliberately points at a paragraph that was cut. Pinning happens in the editor — select text, right-click — or from the target's own Notes section.

## Notes

<img src="/screenshots/inspector-notes-light.png" alt="The Notes section of a chapter, showing an attached note and the Attach menu" class="light-only">
<img src="/screenshots/inspector-notes-dark.png" alt="The Notes section of a chapter, showing an attached note and the Attach menu" class="dark-only">

The same connection seen from the other side — on any entity, the notes attached *to* it, with their quoted passages and the same stale flag. **Attach** pins an existing note to the whole document, or creates a brand-new note and takes you to it. See [Annotations](/guide/annotations) for how quotes survive editing.

## Fields

<img src="/screenshots/inspector-fields-single-light.png" alt="Single-value fields of a faction: motto, founding year, seat" class="light-only">
<img src="/screenshots/inspector-fields-single-dark.png" alt="Single-value fields of a faction: motto, founding year, seat" class="dark-only">

Your type's own fields, exactly as you defined them in the [type editor](/guide/entity-types). Single-value fields — a line of text, a number, one link — share the **Fields** section: above, a faction's motto, founding year, and seat.

<img src="/screenshots/inspector-fields-multi-light.png" alt="Multi-value field sections of a chapter: POV, Cast, Locations" class="light-only">
<img src="/screenshots/inspector-fields-multi-dark.png" alt="Multi-value field sections of a chapter: POV, Cast, Locations" class="dark-only">

Fields that hold several entries — a cast, a list of holdings — each get a **section of their own**, with a remove button per entry and an **Add** menu offering everything eligible: above, a chapter's POV, cast, and locations. Blue entries are links — click one to go there.

## Referenced By

<img src="/screenshots/inspector-referencedby-light.png" alt="The Referenced By section listing everything that points at this entity" class="light-only">
<img src="/screenshots/inspector-referencedby-dark.png" alt="The Referenced By section listing everything that points at this entity" class="dark-only">

Everything in the book that points *at* this entity — chapters that cast this character, notes about her, items she owns, the part that contains this chapter. It's the answer to "where does this appear?", kept up to date automatically. Click any entry to jump there. Something nothing points at yet says so plainly: "Nothing references this yet."

## Journey

<img src="/screenshots/inspector-journey-light.png" alt="The Journey section: a character's appearances through the manuscript, with POV badge and story times" class="light-only">
<img src="/screenshots/inspector-journey-dark.png" alt="The Journey section: a character's appearances through the manuscript, with POV badge and story times" class="dark-only">

A character's itinerary through your book — every chapter they appear in, in reading order, with the story time, a **POV** badge where the chapter looks through their eyes, and who and what else shares each scene. It's worked out entirely from the chapters themselves; there's nothing to maintain here. See [Journeys](/guide/journeys).
