//
//  ContentView.swift
//  GoogleTranslateDemo
//
//  Created by Frad LEE on 8/13/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI
import SwiftGoogleTranslate

struct ContentView: View {
    
    @State private var text: String = ""
    @State private var targetText : String = ""
    @State private var isEditing: Bool = false

    var body: some View {

        ZStack {
            Rectangle()
                .foregroundColor(Color(red:0.91, green:0.92, blue:0.94))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                TextField(isEditing ? "" : "Enter text", text: $text) {
                }
                    .font(.system(size: 34, weight: .bold))
                    .accentColor(Color.black)
                    .multilineTextAlignment(.center)
                    .onTapGesture {self.isEditing.toggle()}
                    .frame(height: 150)
                    .padding()
                Button(action: {
                    SwiftGoogleTranslate.shared.translate(self.text, "zh", "en") { (text, error) in
                      if let t = text {
                        self.targetText = t
                      }
                    }
                }) {
                    Image(systemName: isEditing ? "chevron.right.circle" : "chevron.up.chevron.down")
                        .font(.system(size: 34, weight: .bold))
                        .padding(.vertical, 32)
                        .accentColor(Color.black)
                        .frame(width: 100, height: 100)
                        .padding()
                }
                Text(isEditing ? "\(targetText)": "🇨🇳")
                    .font(.system(size: 34, weight: .bold))
                    .accentColor(Color.black)
                    .multilineTextAlignment(.center)
                    .frame(height: 150)
                    .padding()
                    .animation(.spring())
                Spacer()
                Text("a little work with 💬")
                    .foregroundColor(Color.black.opacity(0.5))
                    .font(.system(size: 17, weight: .regular))
                    .italic()
                    .padding(.top, 16)
                    .padding(.bottom, 16)
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

