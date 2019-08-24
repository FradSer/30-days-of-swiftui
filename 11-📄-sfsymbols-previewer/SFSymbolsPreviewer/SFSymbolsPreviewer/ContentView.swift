//
//  ContentView.swift
//  SFSymbolsPreviewer
//
//  Created by Frad LEE on 8/22/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI
import GridStack

var weightList : [Font.Weight] = [.black, .heavy, .bold, .semibold, .medium, .regular, .light, .thin, .ultraLight]

struct SymbolDetail: View {
    var symbol: String
    
    @State var colorR: Double
    @State var colorG: Double
    @State var colorB: Double
    
    @State var symbolWeight: Font.Weight
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: symbol)
                .foregroundColor(Color(red: colorR, green: colorG, blue: colorB, opacity: 1.0))
                .font(.system(size: 96, weight: symbolWeight))
                .frame(width: 200, height: 200, alignment: .center).background(Color.white).cornerRadius(32)
            Spacer()
            Text(symbol).font(.headline)
            Spacer()
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    HStack {
                        Image(systemName: "r.circle")
                            .foregroundColor(Color.red.opacity(0.5))
                            .font(.system(size: 20))
                        Slider(value: $colorR, in: 0.0...1.0)
                            .accentColor(Color.red.opacity(colorR))
                        Image(systemName: "r.circle.fill")
                            .foregroundColor(Color.red)
                            .font(.system(size: 25))
                    }.padding()
                    HStack {
                        Image(systemName: "g.circle")
                            .foregroundColor(Color.green.opacity(0.5))
                            .font(.system(size: 20))
                        Slider(value: $colorG, in: 0.0...1.0)
                            .accentColor(Color.green.opacity(colorG))
                        Image(systemName: "g.circle.fill")
                            .foregroundColor(Color.green)
                            .font(.system(size: 25))
                    }.padding()
                    HStack {
                        Image(systemName: "b.circle")
                            .foregroundColor(Color.blue.opacity(0.5))
                            .font(.system(size: 20))
                        Slider(value: $colorB, in: 0.0...1.0)
                            .accentColor(Color.blue.opacity(colorB))
                        Image(systemName: "b.circle.fill")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 25))
                    }.padding()
                }
            }
        }
    }
}

struct ContentView: View {
    @State var weightListSelect: Int
    var body: some View {
        return NavigationView{
            VStack {
                GridStack(minCellWidth: 120, spacing: 0, numItems: symbols.count) { index, cellWidth in
                    NavigationLink(destination: SymbolDetail(symbol: symbols[index], colorR: Double.random(in: 0..<1), colorG: Double.random(in: 0..<1), colorB: Double.random(in: 0..<1), symbolWeight: weightList[self.weightListSelect])) {
                        VStack {
                            Spacer()
                                .frame(height: 20)
                            Image(systemName: symbols[index])
                                .foregroundColor(Color.black)
                                .font(.system(size: 48, weight: weightList[self.weightListSelect]))
                                .frame(width: 60, height: 60, alignment: .center)
                            Spacer()
                            Text("\(symbols[index])")
                                .foregroundColor(Color.black).font(.system(size: 17)).multilineTextAlignment(.center).lineLimit(10)
                                .frame(width: 100, height: 100, alignment: .center)
                            Spacer()
                                .frame(height: 20)
                        }
                        .background(Color.white)
                        .frame(width: 200, height: 200, alignment: .center)
                    }
                }
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.weightListSelect -= 1
                        }) {
                            Image(systemName: "plus.circle")
                                .font(.title)
                        }.disabled(weightListSelect == 0 ? true : false)
                        Spacer()
                        Button(action: {
                            self.weightListSelect += 1
                        }) {
                            Image(systemName: "minus.circle")
                                .font(.title)
                        }.disabled(weightListSelect == 8 ? true : false)
                        Spacer()
                    }.padding()
                    Text("a little work with 📄")
                        .foregroundColor(Color.black.opacity(0.5))
                        .font(.system(size: 17, weight: .regular))
                        .italic()
                }
            }.navigationBarTitle("SF Symbols")
        }.accentColor(Color.black).animation(.spring())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(weightListSelect: 5)
    }
}


struct SymbolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SymbolDetail(symbol: symbols[1], colorR: Double.random(in: 0..<1), colorG: Double.random(in: 0..<1), colorB: Double.random(in: 0..<1), symbolWeight: weightList[5])
    }
}
#endif
