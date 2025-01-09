//
//  ScrollWheelTabView.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI
import Charts

struct ScrollWheelTabView: View {
    @State private var history: [Double] = []
    
    var body: some View {
        ScrollEventReader { point in
            history.append(point.y)
        }
        .overlay {
            Chart {
                LinePlot(
                    Array(history.enumerated()),
                    x: .value("Index", \.offset),
                    y: .value("Y", \.element)
                )
            }
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    ScrollWheelTabView()
}
