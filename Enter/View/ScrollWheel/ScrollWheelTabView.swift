//
//  ScrollWheelTabView.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

struct ScrollWheelTabView: View {
    @State private var offset: CGVector? = nil
    
    var body: some View {
        ScrollEventReader { offset in
            self.offset = offset
        }
        .overlay {
            Text(String(describing: offset))
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    ScrollWheelTabView()
}
