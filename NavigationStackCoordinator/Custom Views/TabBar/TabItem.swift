//
//  TabItem.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import Foundation
import SwiftUI

class TabItem: Identifiable, Hashable, Equatable {
	
	static func == (lhs: TabItem, rhs: TabItem) -> Bool {
		lhs.id == rhs.id
	}
	var id = UUID()
	var view: AnyView
	
	init(view: AnyView) {
		self.view = view
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
}
