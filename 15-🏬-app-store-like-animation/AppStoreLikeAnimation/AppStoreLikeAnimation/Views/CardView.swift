//
//  CardView.swift
//  AppStoreLikeAnimation
//
//  Created by Frad LEE on 9/10/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

// MARK: - Setup
let screenSize = UIScreen.main.bounds

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.25), radius: 16)
    }
}

// MARK: - Card View
struct CardView: View {
    
    @State private var cardActived: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                
                // MARK: Card Header
                Rectangle()
                    .foregroundColor(Color.gray)
                    .cornerRadius(cardActived ? 0 : 16)
                VStack(alignment: .leading) {
                    Text("Get Started".uppercased())
                        .font(.headline)
                        .padding(.top, cardActived ? 50 : nil)
                    HStack {
                        Text("Title of the Super App")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 100)
                        Spacer()
                    }
                    Spacer()
                    Text("The most descriptive text ever")
                        .font(.headline)
                        .padding(.bottom)
                    }.padding()
                
                // MARK: Close Button on Header
                if self.cardActived {
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: { self.cardActived = false }) {
                                Image(systemName: "xmark.circle.fill").font(.largeTitle).foregroundColor(Color.white).padding(.top, 64).padding(.trailing, 32).shadow(radius: 16)
                            }
                        }
                        Spacer()
                    }
                }
            }
            .frame(height: 500)
            .padding(cardActived ? 0 :16)
            .onTapGesture { self.cardActived.toggle()}
            
            // MARK: Card Details View
            if self.cardActived {
                CardDetailsView().transition(.moveAndScale)
            }
        }
        .frame(height: cardActived ? screenSize.height : 532, alignment: .top)
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: cardActived ? true : false)
        .animation(.easeInOut(duration: 0.5))
    }
}

struct CardView_Previews: PreviewProvider {
    
    @State static var cardIsActived: Bool = true
    
    static var previews: some View {
        CardView()
    }
}
