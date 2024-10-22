//
//  ContentView.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

struct ContentView: View {
    @State private var keys: Set<Key> = []
    @State private var disabledKey: Key?
    @FocusState private var focused: Bool
    @Environment(\.keyModifiers) private var modifiers: Set<KeyModifier>

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                if let disabledKey {
                    KeyView(key: disabledKey)
                        .opacity(0.5)
                } else if keys.isEmpty {
                    Text("Press any key to get started!")
                        .opacity(0.5)
                }
                ForEach(keys.sorted(), id: \.self) { key in
                    KeyView(key: key)
                }
            }
            HStack {
                ForEach(KeyModifier.allCases, id: \.self) { modifier in
                    KeyView(key: .modifier(modifier), size: 18)
                        .opacity(modifiers.contains(modifier) ? 1 : 0.5)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .focusable()
        .focused($focused)
        .focusEffectDisabled()
        .onAppear {
            focused = true
        }
        .onKeyPress(phases: .all) { keyPress in
            let key = Key(keyPress.key)
            
            switch keyPress.phase {
            case .down:
                keys.insert(key)
                disabledKey = nil
                return .handled
            case .up:
                if keys.count == 1 {
                    disabledKey = key
                }
                keys.remove(key)
                return .handled
            default:
                return .ignored
            }
        }
    }
}

#Preview {
    KeyModifiersEnvironment {
        ContentView()
    }
}
