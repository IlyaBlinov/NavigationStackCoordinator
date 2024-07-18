//
//  SecondFlowSheetCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import SwiftUI

protocol ISecondFlowSheetCoordinator: AnyObject {
	
	func showFirstSheet()
	
	func showSecondSheet()
	
}

final class SecondFlowSheetCoordinator: Hashable, Identifiable, ISecondFlowSheetCoordinator {
	
	enum Sheet {
		case firstSheet, secondSheet
	}
	
	private let assembly: ISecondFlowSheetCoordinatorAssembly
	private var sheet: Sheet
	
	let id: UUID
	
	init(
		sheet: Sheet,
		assembly: ISecondFlowSheetCoordinatorAssembly
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
		lhs: SecondFlowSheetCoordinator,
		rhs: SecondFlowSheetCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
}
