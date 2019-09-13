//
//  CardDetailsView.swift
//  AppStoreLikeAnimation
//
//  Created by Frad LEE on 9/10/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI

// MARK: - Card Details View
struct CardDetailsView: View {
    var body: some View {
        VStack {
            CardViewBody(bodyString: testBodyString)
            CardViewFooter()
        }
    }
}

// MARK: Card Details View Body
struct CardViewBody: View {
    let bodyString: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.bodyString)
                .font(.body)
                .padding()
                .background(Color.white)
                .lineLimit(nil)
                .frame(height: 1000)
                .autocapitalization(.allCharacters)
        }
    }
}

// MARK: Card Details View Footer
struct CardViewFooter: View {
    var body: some View {
        ZStack {
            Spacer()
                .frame(width: UIScreen.main.bounds.width, height: 100)
            Button(action: {}) {
                HStack {
                    Image(systemName: "square.and.arrow.up").offset(y: -2)
                    Text("Share Story")
                }.foregroundColor(Color.blue)
            }
            .padding(.horizontal, 60)
            .padding(.vertical)
            .background(Color.gray.opacity(0.2)).cornerRadius(8)
        }.background(Color.white)
        .fixedSize()
    }
}


struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView()
    }
}
