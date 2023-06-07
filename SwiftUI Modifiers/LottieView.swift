//
//  LottieView.swift
//  Juno
//
//  Created by Ankit Yadav on 29/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
	
	let lottieFile: String
	
	let animationView = LOTAnimationView()
	
	func makeUIView(context: Context) -> some UIView {
		let view = UIView(frame: .zero)
		
		animationView.animation = lottieFile
		animationView.contentMode = .scaleAspectFit
		animationView.play()
		
		view.addSubview(animationView)
		
		animationView.translatesAutoresizingMaskIntoConstraints = false
		animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
		animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		
		return view
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
}
