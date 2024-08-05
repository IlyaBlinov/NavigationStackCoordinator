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
	
	func hideLoader()
	
}

final class FirstFlowCoordinator: Hashable, IFirstFlowCoordinator {
	
	enum Page {
		case viewInt, viewString, viewDouble
	}
	
	private let navigationManager: INavigationManager
	private let assembly: IFirstFlowCoordinatorAssembly
	private let id: UUID
	private let tabBarManager: ITabBarManager
	
	var page: Page
	
	init(
		page: Page,
		navigationManager: INavigationManager,
		assembly: IFirstFlowCoordinatorAssembly,
		tabBarManager: ITabBarManager
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
		self.navigationManager.push(FirstFlowCoordinator(page: .viewString, navigationManager: navigationManager, assembly: assembly, tabBarManager: tabBarManager))
	}
	
	func showViewInt() {
		
		self.navigationManager.push(FirstFlowCoordinator(page: .viewInt, navigationManager: navigationManager, assembly: assembly, tabBarManager: tabBarManager))
	}
	
	func showViewDouble() {
		self.navigationManager.push(FirstFlowCoordinator(page: .viewDouble, navigationManager: navigationManager, assembly: assembly, tabBarManager: tabBarManager))
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
	
	func hideLoader() {
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

