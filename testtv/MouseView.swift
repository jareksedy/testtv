//
//  MouseView.swift
//  testtv
//
//  Created by Ярослав on 24.12.2023.
//

import SwiftUI

fileprivate enum Constants {
    static let width: CGFloat = 360
    static let height: CGFloat = 200
}

struct MouseView: View {
    @State private var mouseLocation: NSPoint = NSPoint(x: Constants.width / 2, y: Constants.height / 2) {
        didSet {
            dx = (mouseLocation.x - Constants.width / 2) / 12
            dy = (mouseLocation.y - Constants.height / 2) / 12
            viewModel.tv?.sendKey(.move(dx: Int(dx), dy: Int(dy)))
            
            if dy > 13 {
                viewModel.tv?.sendKey(.scroll(dx: 0, dy: -10))
            }
            
            if dy < -13 {
                viewModel.tv?.sendKey(.scroll(dx: 0, dy: 10))
            }
        }
    }
    @State private var isDragged: Bool = false
    @State private var isTapped: Bool = false
    @ObservedObject var viewModel: ViewModel
    
    @State private var dx: CGFloat = 0
    @State private var dy: CGFloat = 0
    
    var body: some View {
        ZStack {
            Image(systemName: "plus")
                .fontWeight(.ultraLight)
                .foregroundColor(.green)
                .font(.system(size: 48))
                .monospaced()
                .opacity(0.25)
            
            Text("DX: \(dx.formatted()) DY: \(dy.formatted())")
                .foregroundColor(.green)
                .font(.system(size: 10))
                .monospaced()
                .opacity(0.25)
                .padding(.top, 125)
            
            Rectangle()
                .foregroundColor(.green.opacity(0.05))
                .frame(width: Constants.width, height: Constants.height)
                .contentShape(Rectangle())
            
            Circle()
                .foregroundColor(.green)
                .frame(width: 25, height: 25)
                .scaleEffect(isDragged ? 2.0 : 1.0)
                .opacity(isDragged ? 0.5 : 1)
                .position(x: mouseLocation.x, y: mouseLocation.y)
                .overlay(
                    Circle()
                        .foregroundColor(.green)
                        .scaleEffect(isTapped ? 0.175 : 0)
                        .opacity(isTapped ? 0.25 : 1)
                        .position(x: mouseLocation.x, y: mouseLocation.y)
                )
            
        }
        .frame(width: Constants.width, height: Constants.height)
        .simultaneousGesture(
            DragGesture(coordinateSpace: .named("MouseView"))
                .onChanged { value in
                    mouseLocation = value.location
                    withAnimation(.bouncy(duration: 0.15, extraBounce: 0.3)) {
                        isDragged = true
                    }
                }
                .onEnded { value in
                    mouseLocation = value.location
                    withAnimation(.bouncy(duration: 0.15, extraBounce: 0.3)) {
                        isDragged = false
                    }
                }
        )
        .onTapGesture() { value in
            mouseLocation = value
            viewModel.tv?.sendKey(.click)
            withAnimation(.bouncy(duration: 0.25)) {
                isDragged = true
                isTapped = true
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
                withAnimation(.bouncy(duration: 0.25)) {
                    isDragged = false
                    isTapped = false
                }
            }
        }
        .coordinateSpace(name: "MouseView")
        .onAppear {
            viewModel.tv?.sendKey(.click)
        }
    }
}


#Preview {
    MouseView(viewModel: ViewModel())
}

extension CGFloat {
    func formatted() -> String {
        return String(format: "%.2f", self)
    }
}
