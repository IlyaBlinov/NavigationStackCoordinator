//
//  FirstTabCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import SwiftUI

protocol IFirstTabCoordinator: AnyObject {
	func showFirstFlowCoordinator()
}

final class FirstTabCoordinator: Hashable, IFirstTabCoordinator {
	
	private let navigationManager: INavigationManager
	private let tabBarManager: ITabBarManager
	private let assembly: IFirstTabCoordinatorAssembly
	private let id: UUID
	
	init(
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager,
		assembly: IFirstTabCoordinatorAssembly
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
		self.assembly = assembly
		self.id = UUID()
	}
	
	func showFirstFlowCoordinator() {
		let firstFlowCoordinator = assembly.assemblyFirstFlowCoordinator(page: .viewString, navigationManager: navigationManager, tabBarManager: tabBarManager)
		self.navigationManager.push(firstFlowCoordinator)
	}
	
	// MARK: Hashable
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: FirstTabCoordinator,
		rhs: FirstTabCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
	
}
