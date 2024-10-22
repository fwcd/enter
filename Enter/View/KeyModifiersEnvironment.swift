//
//  EnvironmentValues+KeyModifiers.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

// Based on https://stackoverflow.com/a/74664120/19890279

struct KeyModifiersKey: EnvironmentKey {
    static let defaultValue = Set<KeyModifier>()
}

extension EnvironmentValues {
    var keyModifiers: Set<KeyModifier> {
        get { self[KeyModifiersKey.self] }
        set { self[KeyModifiersKey.self] = newValue }
    }
}

struct KeyModifiersEnvironment<Content>: View where Content: View {
    @ViewBuilder let content: () -> Content
    
    @State private var receiver = KeyModifierMonitor()

    var body: some View {
        content()
            .environment(\.keyModifiers, receiver.modifiers)
    }
}

@Observable
private class KeyModifierMonitor {
    private(set) var modifiers: Set<KeyModifier> = []
    
    init() {
        NSEvent.addLocalMonitorForEvents(matching: .flagsChanged) { [weak self] event in
            self?.modifiers = Set<KeyModifier>(event.modifierFlags)
            return event
        }
    }
}
