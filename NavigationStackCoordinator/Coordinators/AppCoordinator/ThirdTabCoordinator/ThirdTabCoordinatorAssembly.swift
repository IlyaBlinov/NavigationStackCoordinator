//
//  ThirdTabCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation

protocol IThirdTabCoordinatorAssembly: AnyObject {
	func assemblyThirdFlowCoordinator(page: ThirdFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> ThirdFlowCoordinator
}


final class ThirdTabCoordinatorAssembly: IThirdTabCoordinatorAssembly {
	
	weak var coordinator: IThirdTabCoordinator!
	
	func assemblyThirdFlowCoordinator(page: ThirdFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> ThirdFlowCoordinator {
		let assembly = ThirdFlowCoordinatorAssembly()
		let coordinator =
		ThirdFlowCoordinator(
			page: page,
			navigationManager: navigationManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
}


