//
//  FirstFlowSheetCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import SwiftUI

final class FirstFlowSheetCoordinator: Hashable, Identifiable {
	
	enum Sheet {
		case viewInt, viewString, viewDouble
	}
	
	private let assembly: IFirstFlowSheetCoordinatorAssembly
	
	let id: UUID
	private var sheet: Sheet
	
	init(
		sheet: Sheet,
		assembly: IFirstFlowSheetCoordinatorAssembly
	) {
		id = UUID()
		self.sheet = sheet
		self.assembly = assembly
	}
	
	@ViewBuilder
	func view() -> some View {
		switch self.sheet {
		case .viewInt:
			assembly.assemblyViewInt(.init(value: 100, output: ViewIntOutput(coordinator: self)))
		case .viewDouble:
			assembly.assemblyViewDouble(.init(value: 999.0), output: ViewDoubleOutput(coordinator: self))
		case .viewString:
			assembly.assemblyString(.init(value: "FirstFlow"), output: ViewStringOutput(coordinator: self))
		}
		
	}
	
	func showViewString() {
		self.sheet = .viewString
	}
	
	func showViewInt() {
		self.sheet = .viewInt
		
	}
	
	func showViewDouble() {
		self.sheet = .viewDouble
		
	}
	
	// MARK: Hashable
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: FirstFlowSheetCoordinator,
		rhs: FirstFlowSheetCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
}
