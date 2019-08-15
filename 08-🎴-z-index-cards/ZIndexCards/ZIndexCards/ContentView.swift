//
//  ContentView.swift
//  ZIndexCards
//
//  Created by Frad LEE on 8/14/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var list: [Int] = [0, -1, -2]
    @State var color: [Color] = [.red, .yellow, .blue]
    @State var content: [String] = ["Triangle", "Square", "Circle"]
    @State var degrees: [Double] = [-9, 9, 18]
    
    enum DragState {
        case inactive
        case active(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .active(let t):
                return t
            }
        }

        var isActive: Bool {
            switch self {
            case .inactive: return false
            case .active: return true
            }
        }
    }
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
    
    var body: some View {
        let gesture = DragGesture()
            .updating($dragState) { (value, dragInfo, _) in
                dragInfo = .active(translation: value.translation)

            }
            .onEnded{_ in
                self.list = self.f(self.list)
            }

        return ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.95, green: 0.94, blue: 0.92, opacity: 1.0))
                .edgesIgnoringSafeArea(.all)
            ZStack {
                ForEach(0..<self.list.count, id: \.self) { i in
                    CardView(index: Double(self.list[i]),content: self.content[i], color: self.color[i])
                        .scaleEffect(self.list[i] == 0 ? (self.dragState.isActive ? 1.2 : 1.0) : 1.0)
                        .rotationEffect(Angle(degrees:
                            self.dragState.isActive ? 0 : (
                                self.list[i] == 0 ? 0 : (
                                    self.list[i] == -1 ? Double.random(in: 0...24) : (
                                        self.list[i] == -2 ? Double.random(in: -24...0) : 0
                                    )
                                )
                            )
                        ))
                        .gesture(gesture)
                        .offset(
                            x: self.list[i] == 0 ? self.viewState.width + self.dragState.translation.width * 0.8 : .zero,
                            y: self.list[i] == 0 ? self.viewState.height + self.dragState.translation.height * 0.8 : .zero
                        )
                        .animation(.spring())
                }
            }
            VStack {
                Spacer()
                Text("a little work with 🎴")
                    .foregroundColor(Color.black.opacity(0.5))
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
            }
        }
        
    }
    func f(_ list: [Int]) -> [Int] {
        var a = list
        let b = a.removeLast()
        a.insert(b, at: 0 )
        return a
    }
}

struct CardView: View {
    let index: Double
    let content : String
    let color : Color

    var body: some View {
        return ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(color)
                .shadow(color: Color.black.opacity(0.25), radius: 16)
            if content == "Circle" {
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100, alignment: .center)
                    .offset(x: 62, y: 130)
            } else if content == "Square" {
                Spacer()
                    .background(Color.white)
                    .frame(width: 84, height: 84, alignment: .center)
                    .offset(x: 62, y: 130)
            } else {
                Triangle()
                    .frame(width: 130, height: 130)
                    .offset(x: 129 - 67, y: 273 - 135)
                    .foregroundColor(Color.white)
            }
        }
        .frame(width: 264, height: 400, alignment: .center)
        .zIndex(index)
    }
}

struct Triangle: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width
                let middle = width / 2
                let topHeight = 98/130 * height
                let topWidth = topHeight / sqrt(3)
                
                path.addLines([
                    CGPoint(x: middle, y: 0),
                    CGPoint(x: middle - topWidth, y: topHeight),
                    CGPoint(x: middle + topWidth, y: topHeight),
                ])
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
