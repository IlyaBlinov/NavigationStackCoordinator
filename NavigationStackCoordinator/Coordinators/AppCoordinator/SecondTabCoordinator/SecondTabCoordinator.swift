//
//  SecondTabCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import SwiftUI

protocol ISecondTabCoordinator: AnyObject {
	func showViewString()
}

final class SecondTabCoordinator: ISecondTabCoordinator {
	
	private let navigationManager: INavigationManager
	private let tabBarManager: ITabBarManager
	private let assembly: ISecondTabCoordinatorAssembly
	
	
	init(
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager,
		assembly: ISecondTabCoordinatorAssembly
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
		self.assembly = assembly
		
	}
	
	@ViewBuilder
	func view() -> some View {
		assembly.assemblySecondTabView(model: .init(value: "I'm SecondTab"))
	}
	
	func showViewString() {
		let firstFlowCoordinator = assembly.assemblySecondFlowCoordinator(page: .viewString, navigationManager: navigationManager, tabBarManager: tabBarManager)
		self.navigationManager.push(firstFlowCoordinator)
	}
	
	
}
