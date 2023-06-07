//
//  BorderModifier.swift
//  Juno
//
//  Created by Ankit Yadav on 29/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

fileprivate struct BorderModifer: ViewModifier {
	
	var cornerRadius: CGFloat = 7
	var borderColor: Color = UIColor.gray.swiftUIColor
	var lineWidth: CGFloat = 1
	
	func body(content: Content) -> some View {
		content
			.overlay(
				RoundedRectangle(cornerRadius: cornerRadius)
					.stroke(borderColor, lineWidth: lineWidth)
			)
	}
}

extension View {
	
	func addBorder(cornerRadius: CGFloat = 7, borderColor: Color = UIColor.gray.swiftUIColor, lineWidth: CGFloat = 1) -> some View {
	
		self.modifier(BorderModifer(cornerRadius: cornerRadius, borderColor: borderColor, lineWidth: lineWidth))
	}
}

