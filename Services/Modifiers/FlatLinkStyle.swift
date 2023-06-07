//
//  FlatLinkStyle.swift
//  Juno
//
//  Created by Ankit Yadav on 19/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

struct FlatLinkStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
	}
}
