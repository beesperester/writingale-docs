# Screenshot capture

Not part of the site — VitePress builds only the `.md` under `guide/`,
`reference/` and the root, and this directory is outside `public/`.
(This file is listed in `srcExclude` so it isn't published either.)

Everything about *why* it works the way it does is in
[`../CLAUDE.md`](../CLAUDE.md) § Screenshots. This is the short version.

## Running it

Build the app first — the scripts expect it under the same scratch
directory they write to:

```sh
xcodebuild -project ../../app/App/Writingale.xcodeproj -scheme Writingale \
  -derivedDataPath /tmp/writingale-capture/dd build
```

Then, from this directory, four passes per appearance:

```sh
./cap-full.sh light && ./cap-crops.sh light && ./cap-interact.sh light && ./cap-drags.sh light
./cap-full.sh dark  && ./cap-crops.sh dark  && ./cap-interact.sh dark  && ./cap-drags.sh dark
```

Results land in `/tmp/writingale-capture/shots`. Look at them before
copying them over `../public/screenshots/` — every pass drives the real
UI, and a mistimed click produces a plausible-looking wrong picture
rather than an error.

Set `WG_SCRATCH` to move the working directory, `WG_APP` to point at an
app bundle you built somewhere else.

## What's here

| File | |
|---|---|
| `lib.sh` | Launching, window normalization, capture, input. Read this first |
| `cap-full.sh` | Whole-window shots that introduce a view |
| `cap-crops.sh` | The inspector sections, editor modes, sheets, control rows |
| `cap-interact.sh` | Menus, popovers, typing — anything needing the app driven |
| `cap-drags.sh` | The shots taken with the mouse button still down |
| `windowid.swift` | Prints the app window's CoreGraphics id, for `screencapture -l` |
| `mouse.swift` | Clicks, scrolls and drags via `CGEvent` |

The Swift helpers are compiled automatically when they change.

## Requirements

The terminal running these needs **Screen Recording** and
**Accessibility** permission in System Settings → Privacy & Security.
Without Accessibility the window is never resized and every geometry in
these scripts is wrong.

## Things that will bite you

- **A completed drag really edits the book.** `cap-drags.sh` calls
  `reset_book` before each one for that reason.
- **A preference passed on the command line can't be changed from
  inside the app** — it's in the argument domain. That's why
  distraction-free mode is set by argument and not by pressing ⌘.
- **`screencapture -l` returns a blank image during a drag.** Held-drag
  shots capture the screen and crop, mid-glide. See `hold_shot`.
- **Always pass `-autoSelectType` with `-autoSelectName`.** The example
  book has two entities called "The Heat-Ray".
