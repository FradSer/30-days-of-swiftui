//
//  ContentView.swift
//  TypefaceComparison
//
//  Created by Frad LEE on 8/8/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView : View {
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
    
    @State var rotationX: Double
    
    var body: some View {
        
        let gesture = DragGesture()
        .updating($dragState) { (value, dragInfo, _) in
            dragInfo = .active(translation: value.translation)
        }
        
        return VStack {
            Spacer()
            ZStack {
                Text("A")
                    .font(.system(size: 400))
                    .foregroundColor(Color.red.opacity(0.5))
                    .fixedSize()
                .offset(
                    x: viewState.width - CGFloat(rotationX),
                    y: viewState.height
                )
                Text("A")
                .font(Font.custom("Futura", size: 400))
                .foregroundColor(Color.blue.opacity(0.5))
                .padding(.leading)
                .fixedSize()
                .offset(
                    x: viewState.width + dragState.translation.width + CGFloat(rotationX),
                    y: viewState.height
                )
                .gesture(gesture)
                .animation(.spring())
            }
            .shadow(color: Color.black.opacity(0.25), radius: 8, x: 8, y: 8)
            .rotation3DEffect(.degrees(rotationX), axis: (x: 0, y: 1, z: 0))
            
            Spacer()
            
            HStack {
                Image(systemName: "0.circle")
                    .font(.system(size: 20))
                Slider(value: $rotationX, in: 0.0...45.0, step: 1.0)
                .accentColor(Color.black)
                Image(systemName: "45.circle")
                    .font(.system(size: 24))
            }.padding(.all, 32)
            Text("a little work with 🔠")
                .foregroundColor(Color.black.opacity(0.5))
                .font(.system(size: 17, weight: .regular))
                .italic()
                .padding(.top, 16)
                .padding(.bottom, 16)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rotationX: 0.0)
    }
}
#endif
