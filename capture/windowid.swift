import CoreGraphics
import Foundation

// Prints "<windowID> <x> <y> <w> <h>" for the frontmost on-screen window
// whose owning process name matches argv[1] (default "Writingale"),
// largest first — the document window rather than a popover.
let target = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "Writingale"
let wantSmallest = CommandLine.arguments.contains("--smallest")

guard let list = CGWindowListCopyWindowInfo(
    [.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID
) as? [[String: Any]] else { exit(1) }

var rows: [(Int, CGRect)] = []
for info in list {
    guard let owner = info[kCGWindowOwnerName as String] as? String, owner == target,
          let id = info[kCGWindowNumber as String] as? Int,
          let boundsDict = info[kCGWindowBounds as String] as? [String: Any],
          let rect = CGRect(dictionaryRepresentation: boundsDict as CFDictionary),
          let layer = info[kCGWindowLayer as String] as? Int, layer >= 0
    else { continue }
    if rect.width < 40 || rect.height < 40 { continue }
    rows.append((id, rect))
}
guard !rows.isEmpty else { exit(2) }
rows.sort { $0.1.width * $0.1.height > $1.1.width * $1.1.height }
let pick = wantSmallest ? rows.last! : rows.first!
print("\(pick.0) \(Int(pick.1.minX)) \(Int(pick.1.minY)) \(Int(pick.1.width)) \(Int(pick.1.height))")
