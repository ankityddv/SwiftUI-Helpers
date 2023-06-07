//
//  conditionalIfModifier.swift
//  Juno
//
//  Created by Ankit Yadav on 16/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

extension View {
	@ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
	
	fileprivate func withHostingWindow(_ callback: @escaping (UIWindow?) -> Void) -> some View {
		self.background(HostingWindowFinder(callback: callback))
	}
}

fileprivate struct HostingWindowFinder: UIViewRepresentable {
	var callback: (UIWindow?) -> ()

	func makeUIView(context: Context) -> UIView {
		let view = UIView()
		DispatchQueue.main.async { [weak view] in
			self.callback(view?.window)
		}
		return view
	}

	func updateUIView(_ uiView: UIView, context: Context) {
	}
}
