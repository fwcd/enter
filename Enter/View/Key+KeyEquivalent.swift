//
//  Key+KeyEquivalent.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

extension Key {
    init(_ keyEquivalent: KeyEquivalent) {
        self = switch keyEquivalent {
        case .delete: .delete
        case .deleteForward: .deleteForward
        case .escape: .escape
        case .leftArrow: .arrow(.left)
        case .rightArrow: .arrow(.right)
        case .downArrow: .arrow(.down)
        case .upArrow: .arrow(.up)
        case .return: .return
        case .space: .space
        case .tab: .tab
        case .clear: .clear
        case .home: .home
        case .end: .end
        case .pageUp: .pageUp
        case .pageDown: .pageDown
        default: .character(keyEquivalent.character)
        }
    }
}
