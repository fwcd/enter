//
//  ScrollEventReader.swift
//  Enter
//
//  Created on 09.01.25
//

import SwiftUI

struct ScrollEventReader: NSViewControllerRepresentable {
    let onEvent: (CGVector) -> Void
    
    func makeNSViewController(context: Context) -> ViewController {
        ViewController(onEvent: onEvent)
    }
    
    func updateNSViewController(_ vc: ViewController, context: Context) {
        vc.onEvent = onEvent
    }
    
    final class ViewController: NSViewController {
        fileprivate var onEvent: (CGVector) -> Void
        
        init(onEvent: @escaping (CGVector) -> Void) {
            self.onEvent = onEvent
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            nil
        }
        
        override func scrollWheel(with event: NSEvent) {
            onEvent(CGVector(dx: event.scrollingDeltaX, dy: event.scrollingDeltaY))
        }
    }
}
