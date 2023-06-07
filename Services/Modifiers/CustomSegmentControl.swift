//
//  CustomSegmentControl.swift
//  Juno
//
//  Created by Ankit Yadav on 23/05/23.
//  Copyright © 2023 Avineet Gupta. All rights reserved.
//

import SwiftUI

struct AdvancedSegmentedPicker<T: CustomStringConvertible & Hashable>: View {
	
	var items: [T]
	@Binding var selectedItem: T
	
	var backgroundColor: UIColor? = nil
	var selectedSegmentTintColor: UIColor? = nil
	var selectedSegmentForegroundColor: UIColor? = nil
	var normalSegmentForegroundColor: UIColor? = nil
	
	@State private var renderView: Bool = Bool()
	
	var body: some View {
		
		return Group {
			
			if renderView {
				SegmentedPickerView(items: items, selectedItem: $selectedItem, backgroundColor: backgroundColor, selectedSegmentTintColor: selectedSegmentTintColor,
												selectedSegmentForegroundColor: selectedSegmentForegroundColor, normalSegmentForegroundColor: normalSegmentForegroundColor)
				
			}
			else {
				SegmentedPickerView(items: items, selectedItem: $selectedItem, backgroundColor: backgroundColor, selectedSegmentTintColor: selectedSegmentTintColor,
									   selectedSegmentForegroundColor: selectedSegmentForegroundColor, normalSegmentForegroundColor: normalSegmentForegroundColor)
				
			}
		}
		.onChange(of: backgroundColor) { _ in renderView.toggle() }
		.onChange(of: selectedSegmentTintColor) { _ in renderView.toggle() }
		.onChange(of: selectedSegmentForegroundColor) { _ in renderView.toggle() }
		.onChange(of: normalSegmentForegroundColor) { _ in renderView.toggle() }
	}
}


private struct SegmentedPickerView<T: CustomStringConvertible & Hashable>: View {
	
	var items: [T]
	@Binding var selectedItem: T
	
	init(items: [T], selectedItem: Binding<T>, backgroundColor: UIColor? = nil,
		 selectedSegmentTintColor: UIColor? = nil, selectedSegmentForegroundColor: UIColor? = nil, normalSegmentForegroundColor: UIColor? = nil) {
		
		self.items = items
		self._selectedItem = selectedItem
		
		UISegmentedControl.appearance().backgroundColor = backgroundColor
		UISegmentedControl.appearance().selectedSegmentTintColor = selectedSegmentTintColor
		
		if let unwrappedSelectedSegmentForegroundColor: UIColor = selectedSegmentForegroundColor {
			UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: unwrappedSelectedSegmentForegroundColor], for: .selected)
		}
		else {
			UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.label], for: .selected)
		}
		
		if let unwrappedNormalSegmentForegroundColor: UIColor = normalSegmentForegroundColor {
			UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: unwrappedNormalSegmentForegroundColor], for: .normal)
		}
		else {
			UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.label], for: .normal)
		}
	}
	
	var body: some View {
		
		Picker("", selection: $selectedItem) {
			
			ForEach(items, id: \.self) { item in
				
				Text(String(describing: item))
			}
		}
		.pickerStyle(SegmentedPickerStyle())
	}
}
