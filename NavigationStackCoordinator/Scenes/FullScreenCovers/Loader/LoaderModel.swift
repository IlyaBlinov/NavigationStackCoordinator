//
//  LoaderFullScreenCoverModel.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 19.07.2024.
//

import Foundation
import SwiftUI

enum LoaderModel {
	
	struct SceneInput: Hashable, Identifiable {
		static func == (lhs: LoaderModel.SceneInput, rhs: LoaderModel.SceneInput) -> Bool {
			lhs.id == rhs.id
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		let id: UUID
		
		
		init() {
			self.id = UUID()
		}
	}
	
	enum Start {
		struct Event {}
		struct State {}
		struct Props {}
	}
	
	final class Store: ObservableObject {
		
		@Published var value: Int = 0
		
		deinit {
			print("deinit LoaderFullScreenCoverModel.Store")
		}
	}
}

