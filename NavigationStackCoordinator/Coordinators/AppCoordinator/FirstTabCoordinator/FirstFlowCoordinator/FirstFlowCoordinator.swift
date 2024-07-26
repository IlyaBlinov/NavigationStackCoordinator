//
//  FirstFlowCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import Foundation
import SwiftUI

protocol IFirstFlowCoordinator: AnyObject {
	
	func showViewString()
	
	func showViewInt()
	
	func showViewDouble()
	
	func showSecondFlowCoordinatorView()
	
	func selectNewTab(index: Int)
	
	func showFirstSheet()
	
	func dismissSheet()
	
	func showLoader()
	
	func dismissFullScreenCover()
	
}

final class FirstFlowCoordinator: Hashable, IFirstFlowCoordinator {
	
	enum Page: CaseIterable {
		case viewInt, viewString, viewDouble
	}
	
	private let navigationManager: NavigationManager
	private let assembly: IFirstFlowCoordinatorAssembly
	
	private let id: UUID
	private var page: Page
	private let tabBarManager: TabBarManager

	
	init(
		page: Page,
		navigationManager: NavigationManager,
		assembly: IFirstFlowCoordinatorAssembly,
		tabBarManager: TabBarManager
	) {
		self.id = UUID()
		self.page = page
		self.navigationManager = navigationManager
		self.assembly = assembly
		self.tabBarManager = tabBarManager
	}
	
	//MARK: Tab Bar
	
	func selectNewTab(index: Int) {
		self.tabBarManager.setSelectedIndex(index)
	}
	
	//MARK:  Show Views
	
	@ViewBuilder
	func view() -> some View {
		switch self.page {
		case .viewInt:
			assembly.assemblyViewInt(.init(value: 100))
		case .viewDouble:
			assembly.assemblyViewDouble(.init(value: 999.0))
		case .viewString:
			assembly.assemblyString(.init(value: "FirstFlow"))
		}
			
	}

	func showViewString() {
		self.page = .viewString
		self.navigationManager.push(self)
	}
	
	func showViewInt() {
		self.page = .viewInt
		self.navigationManager.push(self)
	}
	
	func showViewDouble() {
		self.page = .viewDouble
		self.navigationManager.push(self)
	}
	
	func showSecondFlowCoordinatorView() {
		let secondCoordinator = assembly.assemblySecondFlowCoordinator(navigationManager: navigationManager, tabBarManager: tabBarManager)
		self.navigationManager.push(secondCoordinator)
	}
	
	// MARK: Sheets
	
	func showFirstSheet() {
		let coordinator = assembly.assemblySheetCoordinator(sheet: .firstSheet)
		self.navigationManager.showSheet(AnyHashable(coordinator))
	}
	
	func showSecondSheet() {
		let coordinator = assembly.assemblySheetCoordinator(sheet: .secondSheet)
		self.navigationManager.showSheet(AnyHashable(coordinator))
	}
	
	func dismissSheet() {
		self.navigationManager.hideSheet()
	}
	
	// MARK: FullScreenCover
	
	func showLoader() {
		let coordinator = assembly.assemblyFullScreenCoverCoordinator(fullScreenCover: .loader)
		self.navigationManager.showFullScreenCover(AnyHashable(coordinator))
	}
	
	func dismissFullScreenCover() {
		self.navigationManager.hideFullScreenCover()
	}
	
	// MARK: Hashable
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: FirstFlowCoordinator,
		rhs: FirstFlowCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
	
}

