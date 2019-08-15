//
//  ContentView.swift
//  ZIndexCards
//
//  Created by Frad LEE on 8/14/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct card: Identifiable {
    let id: Int
    let name: String
    let content: String
    let color: Color
}

struct ContentView: View {
    var cardList = [
        card(id: 2, name: "Red Card", content:"Triangle", color: Color.red),
        card(id: 1, name: "Yellow Card", content:"Square", color: Color.yellow),
        card(id: 0, name: "Blue Card", content:"Circle", color: Color.blue),
    ]
    
    var body: some View {
        return ZStack {
            Rectangle()
                .foregroundColor(Color(red: 0.95, green: 0.94, blue: 0.92, opacity: 1.0))
                .edgesIgnoringSafeArea(.all)
//            VStack {
//                Spacer()
            ForEach(cardList) { card in
                CardView(index: Double(card.id), name: card.name, content: card.content, color: card.color )
            }
//                Spacer()
            Text("a little work with 🎴")
                .foregroundColor(Color.black.opacity(0.5))
                .font(.system(size: 17, weight: .regular))
                .italic()
                .padding(.top, 16)
                .padding(.bottom, 16)
//            }
        }
//        func changeZIndx() {
//        }
    }
}

struct CardView: View {
    @State var index: Double
    let name: String
    let content : String
    let color : Color
    
    @State var randomDegrees : Double = Double.random(in: -18...18)
    
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
        .onEnded {_ in
//            self.index += 1.0
            self.randomDegrees = Double.random(in: -36...36)
        }
        
        return ZStack {
            Spacer()
                .background(color)
                .cornerRadius(16)
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
        .rotationEffect(Angle.init(degrees: index == 2.0 ? 0.0 : randomDegrees))
        .scaleEffect(dragState.isActive ? 1.1 : 1.0)
//        .gesture(index == 2.0 ? gesture : nil)
        .gesture(gesture)
        .offset(
            x: viewState.width + dragState.translation.width * 0.8,
            y: viewState.height + dragState.translation.height * 0.8
        )
        .animation(.spring())
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
