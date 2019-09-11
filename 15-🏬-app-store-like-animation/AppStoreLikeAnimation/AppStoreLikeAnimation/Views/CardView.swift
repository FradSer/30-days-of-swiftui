//
//  CardView.swift
//  AppStoreLikeAnimation
//
//  Created by Frad LEE on 9/10/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

// MARK: - Setup


// MARK: - Card View
struct CardView: View {
    var body: some View {
        CardViewHeader()
    }
}

// MARK: Card View Header
struct CardViewHeader: View {
    
    @State private var cardActived: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray)
            VStack(alignment: .leading) {
                Text("Get Started".uppercased())
                    .font(.headline)
                    .padding(.top, 50)
                HStack {
                    Text("Title of the Super App")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 150)
                    Spacer()
                }
                Spacer()
                Text("The most descriptive text ever")
                    .font(.headline)
                    .padding(.bottom)
                }.padding()
            }
            .frame(height: cardActived ? nil : 500)
            .padding()
            .onTapGesture {
                self.cardActived = true
                print(self.cardActived)
        }
    }
}

struct CardView_Previews_DarkMode: PreviewProvider {
    static var previews: some View {
        ZStack {
            CardView()
        }
    }
}
