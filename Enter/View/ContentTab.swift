//
//  ContentTab.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

enum ContentTab: String, Hashable, CaseIterable {
    case keyboard = "Keyboard"
    
    var iconName: String {
        switch self {
        case .keyboard: "keyboard"
        }
    }
    
    var displayName: String {
        rawValue
    }
}
