//
//  LottieView.swift
//  LottieShowcase
//
//  Created by Frad LEE on 9/4/19.
//  Copyright © 2019 Frad LEE. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let animationView = AnimationView()
    var fileName = "nil"
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        let animation = Animation.named(fileName)
        animationView.loopMode = .loop
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
            
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
    
}
