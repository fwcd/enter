//
//  Key+EventModifiers.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

extension Set where Element == Key {
    init(_ eventModifiers: EventModifiers) {
        self.init()
        if eventModifiers.contains(.shift) { insert(.shift) }
        if eventModifiers.contains(.option) { insert(.option) }
        if eventModifiers.contains(.command) { insert(.command) }
        if eventModifiers.contains(.control) { insert(.control) }
        if eventModifiers.contains(.capsLock) { insert(.capsLock) }
    }
}
