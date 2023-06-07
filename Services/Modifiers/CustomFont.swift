//
//  CustomFont.swift
//  Juno
//
//  Created by Ankit Yadav on 16/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

enum SlangFontStyle: String {
	case outline = "Slang-Outline"
    case normal = "Slang"
}

enum GrandSlangFontStyle: String {
    case regular = "GrandSlang-B-Side"
}

fileprivate struct SlangFontStyleModifier: ViewModifier {
	
	var weight: SlangFontStyle
	var size: CGFloat
	
	func body(content: Content) -> some View {
		content
			.font(.custom(weight.rawValue, size: size + 2))
	}
}

fileprivate struct GrandSlangFontStyleModifier: ViewModifier {
    
    var weight: GrandSlangFontStyle
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(weight.rawValue, size: size + 2))
    }
}

extension View {
	
    func slangFont(weight: SlangFontStyle, size: CGFloat) -> some View {
		self.modifier(SlangFontStyleModifier(weight: weight, size: size))
	}
    
    func grandSlangFont(weight: GrandSlangFontStyle, size: CGFloat) -> some View {
        self.modifier(GrandSlangFontStyleModifier(weight: weight, size: size))
    }
}

extension UIColor {
	var swiftUIColor: Color {
		Color(self)
	}
}
