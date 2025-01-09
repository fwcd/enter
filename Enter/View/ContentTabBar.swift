//
//  ContentTabBar.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

struct ContentTabBar: View {
    @Binding var selection: ContentTab
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(ContentTab.allCases, id: \.self) { tab in
                Label(tab.displayName, systemImage: tab.iconName)
                    .labelStyle(ContentTabLabelStyle())
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.foreground.opacity(selection == tab ? 0.1 : 0))
                    )
                    .onTapGesture {
                        selection = tab
                    }
            }
        }
    }
}

private struct ContentTabLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 10) {
            configuration.icon
                .font(.system(size: 26))
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 30)
            configuration.title
        }
    }
}

#Preview {
    @Previewable @State var tab: ContentTab = .keyboard
    
    ContentTabBar(selection: $tab)
        .padding()
}
