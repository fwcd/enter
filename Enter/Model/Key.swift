//
//  Key.swift
//  Enter
//
//  Created on 22.10.24
//

import Foundation

enum Key: Hashable, Comparable {
    case delete
    case deleteForward
    case escape
    case `return`
    case space
    case tab
    case modifier(KeyModifier)
    case arrow(Direction)
    case character(Character)
    case function(Int)
}
