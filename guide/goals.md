# Goals & Statistics

Writingale tracks two kinds of targets: a **book-wide goal** and **per-entity goals** — plus a writing history that records how much you actually wrote each day.

## The book goal

Set in **Book Settings** (or `book.yaml` directly):

```yaml
goal:
  comparator: at-least   # about | at-least | at-most
  count: 60000
  unit: words            # words | characters
  deadline: 2026-12-31   # optional
```

- *At least* is the classic novel target; *at most* fits short-form limits; *about* is a soft aim.
- Only **manuscript** words count — [material](/guide/manuscript#material) entities and notes never inflate your progress.

The **goal ring** in the sidebar header fills as you approach the target. Click it for the goal popover with two tabs:

- **Goal** — current count, target, and deadline.
- **History** — words written this session, daily average, daily best, this week's total, and a bar chart of the last seven days.

## Per-entity goals

Any manuscript entity can carry its own word target (`goal: 1500` in frontmatter, or the inspector's **Writing Goal** field). The list column shows live progress — `363 / 1500 words` under the chapter name.

## How history is recorded

Writing statistics are stored per book in `.writingale/stats.json` — delta-based and **never decreasing**: deleting a paragraph doesn't erase the fact that you wrote it. The file is local state and is gitignored by default.
