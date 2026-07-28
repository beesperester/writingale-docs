# Annotations

Annotations let one entity comment on another — a research note pinned to a chapter, an editor's remark attached to one specific sentence. Any type with the `annotator` trait (Notes, in the default template) can do this.

## Two kinds of attachment

- **Whole document** — the note is about the target as a whole.
- **Quoted passage** — the note anchors to an exact quote inside the target. The quoted range is highlighted in the editor; selecting text and right-clicking offers **annotation actions** to attach a note to the selection.

On disk it's plain YAML on the annotating entity:

```yaml
annotations:
- target: scn-11b11b11
  quote: It was a drain.
- target: chp-12121212        # whole-document
```

## Self-healing quotes

Prose moves. Writingale keeps quoted annotations attached through three layers:

1. **Live tracking** — while a document is open, edits move annotation ranges along with the text.
2. **Exact relocation** — on reload, the quote is searched for verbatim and re-anchored where it now lives.
3. **Fuzzy matching** — if the wording changed, a word-level match re-anchors the annotation when it's confident enough, updating the stored quote.

## Stale annotations

If all three layers fail — the passage is genuinely gone — the annotation is flagged **stale** rather than silently dropped. Stale annotations are marked in the inspector so you can re-anchor them to new text or retire them deliberately. The example book keeps one stale annotation on purpose (*Note on the old opening*), pointing at an opening paragraph that was cut in the second draft.

::: tip Where to see annotations
- On the **annotating** entity: the inspector's *Annotates* section lists targets with quote previews and stale flags.
- On the **annotated** document: attached notes are listed in the inspector, and quoted passages are highlighted in the editor.
:::
