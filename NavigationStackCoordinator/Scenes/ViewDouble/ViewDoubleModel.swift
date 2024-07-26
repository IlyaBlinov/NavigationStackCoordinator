//
//  ViewDoubleModel.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import Foundation

enum ViewDoubleModel {
	
	struct SceneInput: Hashable, Identifiable {
		static func == (lhs: ViewDoubleModel.SceneInput, rhs: ViewDoubleModel.SceneInput) -> Bool {
			lhs.id == rhs.id
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		
		let id: UUID
		let value: Double
		
		init(value: Double) {
			self.value = value
			self.id = UUID()
		}
	}
	
	final class Store: ObservableObject {
		
		@Published var value: Double = 0.0
		@Published var taskID: UUID = UUID()
		
		deinit {
			print("deinit ViewDoubleModel.Store")
		}
	}
}
