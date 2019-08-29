//
//  WebView.swift
//  LiZhiZhuangbi
//
//  Created by Frad LEE on 8/29/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI
import WebKit
  
struct WebViewModel : UIViewRepresentable {
      
    let request: URLRequest
      
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
      
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
      
}
  
#if DEBUG
struct WebViewModel_Previews : PreviewProvider {
    static var previews: some View {
        WebViewModel(request: URLRequest(url: URL(string: "https://www.youtube.com/embed/Xys5wvaDUnQ")!))
    }
}
#endif

