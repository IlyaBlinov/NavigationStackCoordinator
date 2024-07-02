//
//  ViewIntModel.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import Foundation
import SwiftUI

enum ViewIntModel {
	
	struct SceneInput: Hashable, Identifiable, Codable {
		static func == (lhs: ViewIntModel.SceneInput, rhs: ViewIntModel.SceneInput) -> Bool {
			lhs.id == rhs.id
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		let id: UUID
		let value: Int
	
		
		init(value: Int) {
			self.value = value
			self.id = UUID()
		}
	}
	
	final class Store: ObservableObject {
		
		@Published var value: Int = 0
		
		deinit {
			print("deinit ViewIntModel.Store")
		}
	}
}
