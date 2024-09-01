//
//  ThirdTabCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation
import SwiftUI

protocol IThirdTabCoordinator: AnyObject {
	func showThirdFlowCoordinator()
}

final class ThirdTabCoordinator: IThirdTabCoordinator {
	
	private let navigationManager: INavigationManager
	private let tabBarManager: ITabBarManager
	private let assembly: IThirdTabCoordinatorAssembly
	
	
	init(
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager,
		assembly: IThirdTabCoordinatorAssembly
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
		self.assembly = assembly
		
	}
	
	func showThirdFlowCoordinator() {
		let coordinator = assembly.assemblyThirdFlowCoordinator(page: .viewString, navigationManager: navigationManager, tabBarManager: tabBarManager)
		self.navigationManager.push(coordinator)
	}
	
	
}
