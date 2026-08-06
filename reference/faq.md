# FAQ

## It says READ-ONLY and my work isn't being saved — why?

Writingale will be free to download, and runs **read-only** until you unlock saving. Everything works — write, rearrange, follow references, explore the graph and the timeline — but nothing is kept when you quit. (Adding images is the one thing switched off entirely, since a picture has nowhere to be saved to.)

Unlocking saving is a **one-time purchase of €49.99**, made inside the app. It is not a subscription. If you have bought it before, on another Mac or after reinstalling, choose **Restore Purchases** rather than paying again.

## Can I edit my book outside Writingale?

Yes — that's the point. Files are plain markdown with YAML frontmatter. Writingale watches the folder and reloads external changes automatically; <kbd>⌘R</kbd> forces a reload. The only rule: don't change an entity's `uid`.

## What happens if I rename a character?

Nothing breaks. References store the uid, not the name; the editor and all views immediately display the new name, and export resolves to whatever the name is at export time.

## Can I use git?

Absolutely. New books get a `.gitignore` (covering `.writingale/` local state). Everything else — manifest, types, entities — is diff-friendly text.

## How do I write a flashback?

Give the chapter a story time before 0 (e.g. `time: { from: -3650 }`). It sits where it belongs in the manuscript, and the timeline's *Story Order* view shows it at its true point in history — switch to *Manuscript Order* to see the difference between telling order and story order.

## What's the difference between a Note annotation and a relationship?

A **relationship** links two story-world entities with a kind ("rivals", "creditor"). An **annotation** attaches an annotator entity (like a Note) to a *document* or a *quoted passage* — it's commentary about the text, not a fact of the world.

## An annotation is marked "stale" — what now?

The quoted passage no longer exists in the target (and fuzzy matching couldn't find it). Open the note, decide whether the comment still applies, and either re-anchor it to new text or remove the annotation. Nothing is deleted for you.

## Why doesn't my entity show on the timeline?

It needs three things: its type has the `timeline` trait, the type isn't opted out (`views: { timeline: false }`), and the entity has a `time.from` value.

## Why doesn't the word count move when I type in a note?

Goals and the manuscript word count only count **manuscript-trait** entities that aren't marked as material. Notes, characters, and asides never inflate progress.

## Can a book have types beyond the default five?

Yes — types are per-book, defined in `types.yaml` or the built-in type editor. The example book adds Factions (with custom fields including text, numbers, lists, and references). See [Entity Types & Traits](/guide/entity-types).

## Where are my writing statistics stored?

Per book, in `.writingale/stats.json` — local state, gitignored, delta-based, and never decreasing.

## Is there an iOS / Windows / Linux version?

The app is macOS-only (macOS 14+), coming to the Mac App Store. Because books are plain markdown and YAML files, they remain readable and editable on any platform even without the app.
