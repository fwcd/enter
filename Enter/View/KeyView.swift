//
//  KeyView.swift
//  Enter
//
//  Created on 22.10.24
//

import SwiftUI

struct KeyView: View {
    let key: Key
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(.white)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                switch key {
                case .shift:
                    Image(systemName: "shift")
                case .option:
                    Image(systemName: "option")
                case .command:
                    Image(systemName: "command")
                case .control:
                    Image(systemName: "control")
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
                case .arrow(let direction):
                    switch direction {
                    case .left:
                        Image(systemName: "arrow.left")
                    case .right:
                        Image(systemName: "arrow.right")
                    case .up:
                        Image(systemName: "arrow.up")
                    case .down:
                        Image(systemName: "arrow.down")
                    }
                case .function(let n):
                    Text("F\(n)")
                case .character(let c):
                    Text("\(c.uppercased())")
                }
            }
            .font(.system(size: 48))
            .frame(width: 128)
    }
}

#Preview {
    HStack {
        KeyView(key: .init("a"))
            .padding()
    }
}
