//
//  KeyView.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

struct KeyView: View {
    let key: Key
    var size: CGFloat = 36
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(.foreground)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                switch key {
                case .delete:
                    Image(systemName: "delete.left")
                case .deleteForward:
                    Image(systemName: "delete.right")
                case .return:
                    Image(systemName: "return")
                case .space:
                    Image(systemName: "space")
                case .tab:
                    Image(systemName: "arrow.right.to.line")
                case .escape:
                    Image(systemName: "escape")
                case .clear:
                    Image(systemName: "trash")
                case .home:
                    Image(systemName: "arrow.up.to.line")
                case .end:
                    Image(systemName: "arrow.down.to.line")
                case .pageUp:
                    Image(systemName: "arrow.up")
                case .pageDown:
                    Image(systemName: "arrow.down")
                case .modifier(let modifier):
                    switch modifier {
                    case .shift:
                        Image(systemName: "shift")
                    case .option:
                        Image(systemName: "option")
                    case .command:
                        Image(systemName: "command")
                    case .control:
                        Image(systemName: "control")
                    case .capsLock:
                        Image(systemName: "capslock")
                    }
                case .arrow(let direction):
                    switch direction {
                    case .left:
                        Image(systemName: "arrowtriangle.left")
                    case .right:
                        Image(systemName: "arrowtriangle.right")
                    case .up:
                        Image(systemName: "arrowtriangle.up")
                    case .down:
                        Image(systemName: "arrowtriangle.down")
                    }
                case .function(let n):
                    Text("F\(n)")
                case .character(let c):
                    Text("\(c)")
                }
            }
            .font(.system(size: size))
            .frame(width: 2 * size)
    }
}

#Preview {
    HStack {
        KeyView(key: .init("a"))
            .padding()
    }
}
