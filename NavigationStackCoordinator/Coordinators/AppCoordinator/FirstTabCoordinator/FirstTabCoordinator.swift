//
//  FirstTabCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import SwiftUI

protocol IFirstTabCoordinator: AnyObject {
	func showViewString()
}

final class FirstTabCoordinator: IFirstTabCoordinator {
	
	private let navigationManager: INavigationManager
	private let tabBarManager: ITabBarManager
	private let assembly: IFirstTabCoordinatorAssembly
	
	
	init(
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager,
		assembly: IFirstTabCoordinatorAssembly
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
		self.assembly = assembly
		
	}
	
	@ViewBuilder
	func view() -> some View {
		assembly.assemblyFirstTabView(model: .init(value: "I'm FirstTab"))
	}
	
	func showViewString() {
		let firstFlowCoordinator = assembly.assemblyFirstFlowCoordinator(page: .viewString, navigationManager: navigationManager, tabBarManager: tabBarManager)
		self.navigationManager.push(firstFlowCoordinator)
	}
	
	
}
