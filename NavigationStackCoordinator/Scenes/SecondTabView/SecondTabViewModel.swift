//
//  SecondTabViewModel.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

enum SecondTabViewModel {
	
	struct SceneInput: Hashable, Identifiable {
		static func == (lhs: SecondTabViewModel.SceneInput, rhs: SecondTabViewModel.SceneInput) -> Bool {
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

final class SecondTabViewStore: ObservableObject {
	
	@Published var value: String = ""
	
	deinit {
		print("deinit SecondStartViewModel.Store")
	}
}
