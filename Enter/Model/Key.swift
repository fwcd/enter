//
//  Key.swift
//  Enter
//
//  Created on 22.10.24
//

import Foundation

enum Key: Hashable {
    case delete
    case deleteForward
    case shift
    case option
    case command
    case control
    case capsLock
    case escape
    case `return`
    case space
    case tab
    case arrow(Direction)
    case character(Character)
    case function(Int)
}
