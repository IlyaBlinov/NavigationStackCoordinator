//
//  StartViewModel.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import Foundation

enum FirstTabViewModel {
	
	struct SceneInput: Hashable, Identifiable {
		static func == (lhs: FirstTabViewModel.SceneInput, rhs: FirstTabViewModel.SceneInput) -> Bool {
			lhs.id == rhs.id
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		
		let value: String
		let id: UUID
		
		init(value: String) {
			self.value = value
			self.id = UUID()
		}
		
	}
	

}

final class FirstTabViewStore: ObservableObject {
	
	@Published var value: String = ""
	
	deinit {
		print("deinit StartViewModel.Store")
	}
}
