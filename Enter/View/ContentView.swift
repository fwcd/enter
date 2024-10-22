//
//  ContentView.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

struct ContentView: View {
    @State private var keys: [Key] = []
    @State private var disabledKey: Key?
    @FocusState private var focused: Bool
    
    var body: some View {
        HStack {
            if let disabledKey {
                KeyView(key: disabledKey)
                    .opacity(0.5)
            } else if keys.isEmpty {
                Text("Press any key to get started!")
                    .opacity(0.5)
            }
            ForEach(keys, id: \.self) { key in
                KeyView(key: key)
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
                keys.append(key)
                disabledKey = nil
                return .handled
            case .up:
                if keys.count == 1 {
                    disabledKey = key
                }
                keys.removeAll { $0 == key }
                return .handled
            default:
                return .ignored
            }
        }
    }
}

#Preview {
    ContentView()
}
