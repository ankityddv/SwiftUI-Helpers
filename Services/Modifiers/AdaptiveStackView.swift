//
//  AdaptiveStackView.swift
//  Juno
//
//  Created by Ankit Yadav on 19/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
	
	@Environment(\.horizontalSizeClass) var sizeClass
	
	let horizontalAlignment: HorizontalAlignment
	let verticalAlignment: VerticalAlignment
	let spacing: CGFloat?
	let content: () -> Content

	init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
		
		self.horizontalAlignment = horizontalAlignment
		self.verticalAlignment = verticalAlignment
		self.spacing = spacing
		self.content = content
	}

	var body: some View {
		Group {
            if UIDevice().isSmallDevice() {
				VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
			} else {
				HStack(alignment: verticalAlignment, spacing: spacing, content: content)
			}
		}
	}
}

