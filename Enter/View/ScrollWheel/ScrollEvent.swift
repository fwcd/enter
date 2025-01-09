//
//  ScrollEvent.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

struct ScrollEvent: Hashable, Identifiable {
    var id = UUID()
    var position: CGPoint
    var delta: CGVector
    var timestamp: TimeInterval
}
