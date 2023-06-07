//
//  CustomFont.swift
//  Juno
//
//  Created by Ankit Yadav on 16/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

enum customFont: String {
	case regular = "LetteraTextLL-Regular"
	case medium = "LetteraTextLL-Medium"
	case bold = "LetteraTextLL-Bold"
}

fileprivate struct LetteraTextFontStyle: ViewModifier {
	
	var weight: customFont
	var size: CGFloat
	
	func body(content: Content) -> some View {
		content
			.font(.custom(weight.rawValue, size: size + 2))
	}
}

extension View {
	func letteraFont(weight: customFont, size: CGFloat) -> some View {
		self.modifier(LetteraTextFontStyle(weight: weight, size: size))
	}
}

extension UIColor {
	var swiftUIColor: Color {
		Color(self)
	}
}
