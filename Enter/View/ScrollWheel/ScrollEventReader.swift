//
//  ScrollEventReader.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

struct ScrollEventReader: NSViewControllerRepresentable {
    let onEvent: (ScrollEvent) -> Void
    
    func makeNSViewController(context: Context) -> ViewController {
        ViewController(onEvent: onEvent)
    }
    
    func updateNSViewController(_ vc: ViewController, context: Context) {
        vc.onEvent = onEvent
    }
    
    final class ViewController: NSViewController {
        fileprivate var onEvent: (ScrollEvent) -> Void
        private var position: CGPoint = .zero
        
        init(onEvent: @escaping (ScrollEvent) -> Void) {
            self.onEvent = onEvent
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            nil
        }
        
        override func scrollWheel(with event: NSEvent) {
            let delta = CGVector(dx: event.scrollingDeltaX, dy: event.scrollingDeltaY)
            position.x += delta.dx
            position.y += delta.dy
            onEvent(.init(position: position, delta: delta, timestamp: event.timestamp))
        }
    }
}
