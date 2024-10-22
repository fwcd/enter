//
//  EventModifiers+ModifierFlags.swift
//  Enter
//
//  Created on 22.10.24
//

import AppKit
import SwiftUI

extension EventModifiers {
    init(_ modifierFlags: NSEvent.ModifierFlags) {
        self.init()
        if modifierFlags.contains(.shift) { insert(.shift) }
        if modifierFlags.contains(.option) { insert(.option) }
        if modifierFlags.contains(.command) { insert(.command) }
        if modifierFlags.contains(.control) { insert(.control) }
        if modifierFlags.contains(.capsLock) { insert(.capsLock) }
    }
}
