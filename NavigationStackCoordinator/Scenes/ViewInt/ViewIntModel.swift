//
//  ViewIntModel.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import Foundation
import SwiftUI

enum ViewIntModel {
	
	struct SceneInput: Hashable, Identifiable {
		static func == (lhs: ViewIntModel.SceneInput, rhs: ViewIntModel.SceneInput) -> Bool {
			lhs.id == rhs.id
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(id)
		}
		let id: UUID
		let value: Int
		let output: IViewIntOutput
	
		
		init(value: Int, output: IViewIntOutput) {
			self.value = value
			self.output = output
			self.id = UUID()
		}
	}
	
	enum Start {
		struct Event {}
		struct State {}
		struct Props {}
	}
	
	enum ChangeValue {
		struct Event {
			let value: Int
		}
		struct State {
			let value: Int
		}
		struct Props {
			let value: Int
		}
	}
	
	enum ShowSheet {
		struct Event {}
		struct State {}
		struct Props {}
	}
	
	
	final class Store: ObservableObject {
		
		@Published var value: Int = 0
		@Published var showSheet: Bool = false
		
		deinit {
			print("deinit ViewIntModel.Store")
		}
	}
}
