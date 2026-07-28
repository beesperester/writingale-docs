# Installation

Writingale currently builds from source. It is a native SwiftUI app.

## Requirements

- macOS 14 or later
- Xcode 15 or later
- [XcodeGen](https://github.com/yonaskolb/XcodeGen) (the Xcode project is generated, not checked in)

## Build from source

```sh
brew install xcodegen
git clone https://github.com/beesperester/writingale.git
cd writingale
xcodegen generate --spec App/project.yml
open App/Writingale.xcodeproj
```

Then build and run the **Writingale** scheme in Xcode.

::: tip Try the example book
Open `ExampleBook/` from the welcome screen to explore a complete sample project, *The Machine Stops* (after E. M. Forster), that uses every feature.
:::

## Command-line build

```sh
xcodebuild -project App/Writingale.xcodeproj -scheme Writingale build
```

The platform-independent core (`Sources/WritingaleCore`) also builds and tests on macOS and Linux:

```sh
swift test
```
