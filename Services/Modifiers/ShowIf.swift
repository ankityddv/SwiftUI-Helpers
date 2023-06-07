//
//  ShowIf.swift
//  Juno
//
//  Created by Ankit Yadav on 16/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

fileprivate struct ShowIf: ViewModifier {
	var condition: Bool
	
	func body(content: Content) -> some View {
		if condition {
			content
		}
	}
}

extension View {
	func showIf(_ condition: Bool) -> some View {
		self.modifier(ShowIf(condition: condition))
	}
}

