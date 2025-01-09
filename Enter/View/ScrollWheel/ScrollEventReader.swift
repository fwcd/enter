//
//  ScrollEventReader.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

struct ScrollEventReader: NSViewControllerRepresentable {
    let onEvent: (CGPoint) -> Void
    
    func makeNSViewController(context: Context) -> ViewController {
        ViewController(onEvent: onEvent)
    }
    
    func updateNSViewController(_ vc: ViewController, context: Context) {
        vc.onEvent = onEvent
    }
    
    final class ViewController: NSViewController {
        fileprivate var onEvent: (CGPoint) -> Void
        private var position: CGPoint = .zero
        
        init(onEvent: @escaping (CGPoint) -> Void) {
            self.onEvent = onEvent
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            nil
        }
        
        override func scrollWheel(with event: NSEvent) {
            position.x += event.scrollingDeltaX
            position.y += event.scrollingDeltaY
            onEvent(position)
        }
    }
}
