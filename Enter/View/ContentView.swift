//
//  ContentView.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

struct ContentView: View {
    @State private var tab: ContentTab = .keyboard
    
    var body: some View {
        ContentDetail(tab: tab)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .top) {
                ContentTabBar(selection: $tab)
                    .padding()
            }
    }
}

#Preview {
    ContentView()
}
