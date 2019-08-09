//
//  ContentView.swift
//  CatScene
//
//  Created by Frad LEE on 8/10/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SceneKitView()
            Text("a little work with 🐱")
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
        ContentView()
    }
}
#endif
