//
//  ScrollWheelTabView.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI
import Charts

struct ScrollWheelTabView: View {
    @State private var history: [ScrollEvent] = []
    
    var body: some View {
        ScrollEventReader { event in
            history.append(event)
        }
        .overlay {
            Chart(history) {
                LineMark(
                    x: .value("Time", $0.timestamp),
                    y: .value("X", Double($0.position.x))
                )
                .foregroundStyle(by: .value("Axis", "X"))
                
                LineMark(
                    x: .value("Time", $0.timestamp),
                    y: .value("Y", Double($0.position.y))
                )
                .foregroundStyle(by: .value("Axis", "Y"))
            }
            .padding()
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    ScrollWheelTabView()
}
