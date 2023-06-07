//
//  ConversionHelper.swift
//  Juno
//
//  Created by Ankit Yadav on 19/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import UIKit
import SwiftUI

struct ConvertUIViewToSwiftUIView: UIViewControllerRepresentable {
	
	var withVC: UIViewController
	
	func makeUIViewController(context: Context) -> UIViewController {
		return withVC
	}

	func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
