//
//  ContentTab.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

enum ContentTab: String, Hashable, CaseIterable {
    case keyboard = "Keyboard"
    case scrollWheel = "Scroll Wheel"
    
    var iconName: String {
        switch self {
        case .keyboard: "keyboard"
        case .scrollWheel: "scroll"
        }
    }
    
    var displayName: String {
        rawValue
    }
}
