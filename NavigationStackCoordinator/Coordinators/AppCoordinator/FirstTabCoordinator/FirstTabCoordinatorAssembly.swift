//
//  FirstTabCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import Foundation
import SwiftUI

protocol IFirstTabCoordinatorAssembly: AnyObject {
	func assemblyFirstFlowCoordinator(page: FirstFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> FirstFlowCoordinator
}


final class FirstTabCoordinatorAssembly: IFirstTabCoordinatorAssembly {
	
	weak var coordinator: IFirstTabCoordinator!
	
	func assemblyFirstFlowCoordinator(
		page: FirstFlowCoordinator.Page,
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager
	) -> FirstFlowCoordinator {
		let assembly = FirstFlowCoordinatorAssembly()
		let coordinator =
		FirstFlowCoordinator(
			page: page,
			navigationManager: navigationManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
}


