//
//  Key+EventModifiers.swift
//  Enter
//
//  Created on 22.10.24
//

import AppKit

extension Set where Element == KeyModifier {
    init(_ eventModifiers: NSEvent.ModifierFlags) {
        self.init()
        if eventModifiers.contains(.capsLock) { insert(.capsLock) }
        if eventModifiers.contains(.control) { insert(.control) }
        if eventModifiers.contains(.option) { insert(.option) }
        if eventModifiers.contains(.shift) { insert(.shift) }
        if eventModifiers.contains(.command) { insert(.command) }
        if eventModifiers.contains(.function) { insert(.function) }
    }
}
