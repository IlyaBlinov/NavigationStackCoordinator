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
	
	func showThirdFlowCoordinatorView()
}




final class SecondFlowCoordinator: Hashable, ISecondFlowCoordinator {
	
	enum Page: CaseIterable {
		case viewInt, viewString, viewDouble
	}
	
	private let navigationManager: INavigationManager
	private let assembly: ISecondFlowCoordinatorAssembly
	private let id: UUID
	private var tabBarManager: ITabBarManager
	
	var page: Page
	
	init(
		page: Page,
		navigationManager: INavigationManager,
		assembly: ISecondFlowCoordinatorAssembly,
		tabBarManager: ITabBarManager
	) {
		id = UUID()
		self.page = page
		self.navigationManager = navigationManager
		self.assembly = assembly
		self.tabBarManager = tabBarManager
	}
	
	@ViewBuilder
	func view() -> some View {
		switch self.page {
		case .viewInt:
			assembly.assemblyViewInt(.init(value: 122))
		case .viewDouble:
			assembly.assemblyViewDouble(.init(value: 43.98))
		case .viewString:
			assembly.assemblyString(.init(value: "Second Flow"))
		}
	}
	
	//MARK: Tab Bar
	
	func selectNewTab(index: Int) {
		self.tabBarManager.setSelectedIndex(index)
	}
	
	//MARK:  Show Views
	
	func showViewString() {
		let coordinator = build(.viewString)
		self.navigationManager.push(coordinator)
	}
	
	func showViewInt() {
		let coordinator = build(.viewInt)
		self.navigationManager.push(coordinator)
	}
	
	func showViewDouble() {
		let coordinator = build(.viewDouble)
		self.navigationManager.push(coordinator)
	}
	
	func showThirdFlowCoordinatorView() {
		let coordinator = assembly.assemblyThirdFlowCoordinator(page: .viewString, navigationManager: navigationManager, tabBarManager: tabBarManager)
		self.navigationManager.push(coordinator)
	}
	
	private func build(_ page: Page) -> SecondFlowCoordinator {
		SecondFlowCoordinator(page: page, navigationManager: navigationManager, assembly: assembly, tabBarManager: tabBarManager)
	}
	
	
	// MARK: Sheets
	
	func showFirstSheet() {
		let sheetCoordinator = assembly.assemblySheetCoordinator(sheet: .firstSheet)
		self.navigationManager.showSheet(AnyHashable(sheetCoordinator))
	}
	
	func showSecondSheet() {
		let sheetCoordinator = assembly.assemblySheetCoordinator(sheet: .secondSheet)
		self.navigationManager.showSheet(AnyHashable(sheetCoordinator))
	}
	
	func dismissSheet() {
		self.navigationManager.hideSheet()
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
	
}
