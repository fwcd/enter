//
//  ContentDetail.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

struct ContentDetail: View {
    let tab: ContentTab
    
    var body: some View {
        switch tab {
        case .keyboard:
            KeyboardTabView()
        }
    }
}

#Preview {
    ContentDetail(tab: .keyboard)
}
