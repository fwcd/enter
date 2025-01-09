//
//  ScrollWheelTabView.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI
import Charts

struct ScrollWheelTabView: View {
    @State private var start: TimeInterval? = nil
    @State private var history: [(x: Double, y: Double)] = []
    
    var body: some View {
        ScrollEventReader { event in
            let start = start ?? event.timestamp
            self.start = start
            history.append((x: event.timestamp - start, y: Double(event.position.y)))
        }
        .overlay {
            Chart {
                LinePlot(
                    history,
                    x: .value("Timestamp", \.x),
                    y: .value("Y", \.y)
                )
            }
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    ScrollWheelTabView()
}
