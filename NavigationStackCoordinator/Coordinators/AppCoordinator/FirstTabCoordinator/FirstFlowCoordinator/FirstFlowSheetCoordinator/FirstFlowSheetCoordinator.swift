//
//  FirstFlowSheetCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import SwiftUI

protocol IFirstFlowSheetCoordinator: AnyObject {
	
	func showFirstSheet()
	
	func showSecondSheet()
}

final class FirstFlowSheetCoordinator: Hashable, Identifiable, IFirstFlowSheetCoordinator {
	
	enum Sheet {
		case firstSheet, secondSheet
	}
	
	private let assembly: IFirstFlowSheetCoordinatorAssembly
	private var sheet: Sheet
	
	let id: UUID
	
	init(
		sheet: Sheet,
		assembly: IFirstFlowSheetCoordinatorAssembly
	) {
		self.id = UUID()
		self.sheet = sheet
		self.assembly = assembly
	}
	
	@ViewBuilder
	func view() -> some View {
		switch self.sheet {
		case .firstSheet:
			assembly.assemblyFirstSheet(FirstSheetModel.SceneInput(value: 15))
		case .secondSheet:
			assembly.assemblySecondSheet(SecondSheetModel.SceneInput(value: 15))
		}
	}
	
	
	func showFirstSheet() {
		self.sheet = .firstSheet
	}
	
	func showSecondSheet() {
		self.sheet = .secondSheet
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
