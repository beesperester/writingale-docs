import CoreGraphics
import Foundation

// Pointer driver for the documentation captures. Coordinates are global
// display points, origin top-left — the same space System Events uses
// for a window's position, so callers can work window-relative.
//
//   mouse click|rightclick|dblclick|move <x> <y>
//   mouse scroll <x> <y> <ticks>            (negative ticks scroll down)
//   mouse drag <x1> <y1> <x2> <y2>          (press, glide, release)
//   mouse holddrag <x1> <y1> <x2> <y2>      (press, glide, stay down)
//   mouse release <x> <y>

let args = CommandLine.arguments
func num(_ i: Int) -> CGFloat { CGFloat(Double(args[i]) ?? 0) }

func post(_ type: CGEventType, _ p: CGPoint, _ button: CGMouseButton = .left, clicks: Int64 = 1) {
    guard let e = CGEvent(mouseEventSource: nil, mouseType: type, mouseCursorPosition: p, mouseButton: button)
    else { return }
    if clicks > 1 { e.setIntegerValueField(.mouseEventClickState, value: clicks) }
    e.post(tap: .cghidEventTap)
}

/// A drag AppKit believes: a real press, many small moves, then a
/// release. One jump from source to target is dropped as noise by the
/// drag-tracking loops.
func glide(from a: CGPoint, to b: CGPoint, steps: Int = 45) {
    for i in 1...steps {
        let t = CGFloat(i) / CGFloat(steps)
        let p = CGPoint(x: a.x + (b.x - a.x) * t, y: a.y + (b.y - a.y) * t)
        post(.leftMouseDragged, p)
        usleep(12_000)
    }
}

let cmd = args.count > 1 ? args[1] : ""
switch cmd {
case "move":
    post(.mouseMoved, CGPoint(x: num(2), y: num(3)))
case "click":
    let p = CGPoint(x: num(2), y: num(3))
    post(.mouseMoved, p); usleep(60_000)
    post(.leftMouseDown, p); usleep(60_000)
    post(.leftMouseUp, p)
case "dblclick":
    let p = CGPoint(x: num(2), y: num(3))
    post(.mouseMoved, p); usleep(60_000)
    post(.leftMouseDown, p, clicks: 1); post(.leftMouseUp, p, clicks: 1); usleep(80_000)
    post(.leftMouseDown, p, clicks: 2); post(.leftMouseUp, p, clicks: 2)
case "rightclick":
    let p = CGPoint(x: num(2), y: num(3))
    post(.mouseMoved, p); usleep(60_000)
    post(.rightMouseDown, p, .right); usleep(60_000)
    post(.rightMouseUp, p, .right)
case "scroll", "hscroll":
    let p = CGPoint(x: num(2), y: num(3))
    post(.mouseMoved, p); usleep(60_000)
    let ticks = Int(args[4]) ?? 0
    let step: Int32 = ticks < 0 ? -3 : 3
    let horizontal = cmd == "hscroll"
    for _ in 0..<abs(ticks) {
        if let e = CGEvent(scrollWheelEvent2Source: nil, units: .line, wheelCount: 2,
                           wheel1: horizontal ? 0 : step,
                           wheel2: horizontal ? step : 0, wheel3: 0) {
            e.location = p
            e.post(tap: .cghidEventTap)
        }
        usleep(30_000)
    }
case "drag", "holddrag":
    let a = CGPoint(x: num(2), y: num(3)), b = CGPoint(x: num(4), y: num(5))
    post(.mouseMoved, a); usleep(120_000)
    post(.leftMouseDown, a); usleep(250_000)
    glide(from: a, to: b)
    if cmd == "drag" { usleep(150_000); post(.leftMouseUp, b) }
case "release":
    post(.leftMouseUp, CGPoint(x: num(2), y: num(3)))
default:
    FileHandle.standardError.write("unknown command\n".data(using: .utf8)!)
    exit(1)
}
