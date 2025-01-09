//
//  ScrollWheelTabView.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI
import Charts

struct ScrollWheelTabView: View {
    private let limit = 1000
    
    @State private var history: [ScrollEvent] = []
    
    private var timeRange: ClosedRange<TimeInterval> {
        (history.first?.timestamp ?? 0)...(history.last?.timestamp ?? 0)
    }
    
    var body: some View {
        ScrollEventReader { event in
            history.append(event)
            if history.count > limit {
                history.removeFirst(history.count - limit)
            }
        }
        .overlay {
            Group {
                if history.isEmpty {
                    Text("Scroll to get started!")
                        .opacity(0.5)
                } else {
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
                    .chartXScale(domain: timeRange)
                }
            }
            .padding()
            .allowsHitTesting(false)
        }
    }
}

#Preview {
    ScrollWheelTabView()
}
