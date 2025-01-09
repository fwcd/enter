//
//  ScrollWheelTabView.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI
import Charts

struct ScrollWheelTabView: View {
    @State private var history: [CGVector] = []
    
    var body: some View {
        ScrollEventReader { delta in
            history.append(delta)
        }
        .overlay {
            Chart {
                ForEach(Array(history.enumerated()), id: \.offset) { event in
                    LineMark(
                        x: .value("Index", event.offset),
                        y: .value("Y", Double(event.element.dy))
                    )
                }
            }
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    ScrollWheelTabView()
}
