//
//  SecondSheetModel.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import Foundation
import SwiftUI

enum SecondSheetModel {
	
	struct SceneInput: Hashable, Identifiable {
		static func == (lhs: SecondSheetModel.SceneInput, rhs: SecondSheetModel.SceneInput) -> Bool {
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
	
	enum Start {
		struct Event {}
		struct State {}
		struct Props {}
	}
	
	enum Dismiss {
		struct Event {}
		struct State {}
		struct Props {}
	}
	
	final class Store: ObservableObject {
		
		@Published var value: Int = 0
		
		deinit {
			print("deinit SecondSheetModel.Store")
		}
	}
}
