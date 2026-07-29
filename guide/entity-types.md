# Entity Types & Traits

Chapters, characters, locations, items, and notes are not hard-coded. Every book declares its own entity types in `types.yaml`, and the whole app — sidebar, list, inspector, graph, timeline — reshapes itself around them.

The example book adds a custom type on top of the defaults: **Faction** (organizations with a motto, members, holdings, and a founding year — the Central Committee and the Homeless).

## Anatomy of a type

```yaml
- id: faction
  name: Faction
  plural: Factions
  prefix: fac          # uid prefix: fac-xxxxxxxx
  folder: Factions     # where its files live
  section: Story World # sidebar section
  icon: flag           # any SF Symbol
  color: "#B03A48"     # named palette color or hex
  traits: [relationships, journey]
  fields:
    - { key: motto,    label: Motto,          kind: text }
    - { key: founded,  label: Founded (year), kind: number }
    - { key: holdings, label: Holdings,       kind: list }
    - { key: members,  label: Members,        kind: reference, cardinality: many,
        types: [character] }
    - { key: seat,     label: Seat,           kind: reference, cardinality: one,
        types: [location] }
  template: |
    ## Charter

    ## Methods
```

## Traits

Traits are built-in behaviors you mix into a type:

| Trait | What it adds |
|---|---|
| `manuscript` | The type belongs to the compiled manuscript: it appears in the manuscript tree, can nest children, counts toward goals, and exports. |
| `status` | A completion workflow with configurable stages (default: outline → draft → revision → final), shown as a colored progress ring that fills with the workflow and rolled up into container progress (one arc per nested chapter). |
| `timeline` | Story-time data (`from`, `to`, `label`, `row`) and a card on the [timeline](/guide/timeline). A type can declare a default named row, e.g. `timeline: { row: World Events }`. |
| `relationships` | Typed, annotated links between entities ("creditor", "old friend", …), edited in the inspector. |
| `annotator` | The type can attach itself to other documents or quoted passages — see [Annotations](/guide/annotations). |
| `journey` | The entity's appearances throughout the manuscript are inferred and shown as a [journey](/guide/journeys). |
| `image` | The type labels stored image assets: each entity points at a picture in the book (`file` key, content-hash named) and can be embedded in documents with `![[uid]]` — see [Images](/guide/editor#images). |

Trait data is never destroyed: if you toggle a trait off, existing frontmatter keys survive on disk and come back when you re-enable it.

## Custom fields

Four field kinds cover most structured data:

- `text` — a free-form string (a motto, an epithet)
- `number` — a numeric value (a founding year, a population)
- `list` — a list of strings (character traits, holdings)
- `reference` — links to other entities, with `cardinality: one` or `many`, restricted to given `types`, and optionally `role: pov` to mark the field as the point-of-view reference used by journeys and the timeline

Reserved keys (`uid`, `type`, `name`, `created`, `children`, `index`, `status`, `goal`, `material`, `file`, `time`, `relationships`, `annotations`) cannot be used as field keys.

## The type editor

You don't have to write `types.yaml` by hand. **Book → Edit Entity Types…** opens the type editor: create, reorder, and delete types; pick SF Symbols and colors; define stages, traits, and fields; and edit the starter template each new entity of that type receives.

Two safety valves:

- **Apply Default Template** adds the bundled types (the classic five plus Image) back *additively* — your custom types stay.
- **Deleting a type** offers to keep its files. Kept files show up as "Unrecognized" and are fully restored the moment a type claims them again.

## Colors and icons

Named palette colors: `accent`, `red`, `orange`, `yellow`, `green`, `mint`, `teal`, `cyan`, `blue`, `indigo`, `purple`, `pink`, `brown`, `gray` — or any `#RRGGBB` hex value. Icons are SF Symbols, searchable from the built-in picker.
