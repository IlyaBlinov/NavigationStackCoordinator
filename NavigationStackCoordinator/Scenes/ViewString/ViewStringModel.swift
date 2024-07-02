//
//  ViewStringModel.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import Foundation

enum ViewStringModel {
	
	struct SceneInput: Hashable, Identifiable, Codable {
		static func == (lhs: ViewStringModel.SceneInput, rhs: ViewStringModel.SceneInput) -> Bool {
			lhs.id == rhs.id
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		
		let id: UUID
		let value: String
		//let output: IViewStringOutput
		
		
		init(value: String) {
			self.value = value
		//	self.output = output
			self.id = UUID()
		}
	}
	
	final class Store: ObservableObject {
		
		@Published var value: String = ""
		
		deinit {
			print("deinit ViewStringModel.Store")
		}
	}
}
