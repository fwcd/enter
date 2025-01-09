//
//  ScrollWheelTabView.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI
import Charts

struct ScrollWheelTabView: View {
    @State private var history: [(dx: Double, dy: Double)] = []
    
    var body: some View {
        ScrollEventReader { delta in
            history.append((dx: Double(delta.dx), dy: Double(delta.dy)))
        }
        .overlay {
            Chart {
                LinePlot(
                    Array(history.enumerated()),
                    x: .value("Index", \.offset),
                    y: .value("Y", \.element.dy)
                )
            }
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    ScrollWheelTabView()
}
