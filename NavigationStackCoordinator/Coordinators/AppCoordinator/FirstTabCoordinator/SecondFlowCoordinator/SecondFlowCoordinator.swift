//
//  SecondFlowCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import Foundation
import SwiftUI

protocol ISecondFlowCoordinator: AnyObject {
	
	func showViewString()
	
	func showViewInt()
	
	func showViewDouble()
	
	func selectNewTab(index: Int)
	
	func showSecondSheet()
	
	func showFirstSheet()
}




final class SecondFlowCoordinator: Hashable, ISecondFlowCoordinator {
	
	enum Page: CaseIterable {
		case viewInt, viewString, viewDouble
	}
	
	private let pathManager: PathManager
	private let assembly: ISecondFlowCoordinatorAssembly
	
	private let id: UUID
	private var page: Page
	private var tabBarManager: TabBarManager
	
	
	init(
		page: Page,
		pathManager: PathManager,
		assembly: ISecondFlowCoordinatorAssembly,
		tabBarManager: TabBarManager
	) {
		id = UUID()
		self.page = page
		self.pathManager = pathManager
		self.assembly = assembly
		self.tabBarManager = tabBarManager
	}
	
	@ViewBuilder
	func view() -> some View {
		switch self.page {
		case .viewInt:
			ViewInt().configure(.init(value: 100, output: ViewIntOutput(coordinator: self)))
		case .viewDouble:
			ViewDouble().configure(.init(value: 999.0, output: ViewDoubleOutput(coordinator: self)))
		case .viewString:
			ViewString().configure(.init(value: "Second Flow", output: ViewStringOutput(coordinator: self)))
		}
	}
	
	//MARK: Tab Bar
	
	func selectNewTab(index: Int) {
		self.tabBarManager.selectedTabIndex = index
	}
	
	//MARK:  Show Views
	
	func showViewString() {
		self.page = .viewString
		self.pathManager.push(self)
	}
	
	func showViewInt() {
		self.page = .viewInt
		self.pathManager.push(self)
	}
	
	func showViewDouble() {
		self.page = .viewDouble
		self.pathManager.push(self)
	}
	
	
	// MARK: Sheets
	
	func showFirstSheet() {
		let sheetCoordinator = assembly.assemblySheetCoordinator(sheet: .firstSheet)
		self.pathManager.sheet = AnyHashable(sheetCoordinator)
	}
	
	func showSecondSheet() {
		let sheetCoordinator = assembly.assemblySheetCoordinator(sheet: .secondSheet)
		self.pathManager.sheet = AnyHashable(sheetCoordinator)
	}
	
	func dismissSheet() {
		self.pathManager.sheet = nil
	}
	
	// MARK: Hashable
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: SecondFlowCoordinator,
		rhs: SecondFlowCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
	
	func push<V>(_ value: V) where V : Hashable {
		pathManager.push(value)
	}
}
