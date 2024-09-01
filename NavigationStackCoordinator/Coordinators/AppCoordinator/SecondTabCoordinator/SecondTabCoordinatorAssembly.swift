//
//  SecondTabAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation

protocol ISecondTabCoordinatorAssembly: AnyObject {
	func assemblySecondFlowCoordinator(page: SecondFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> SecondFlowCoordinator
}


final class SecondTabCoordinatorAssembly: ISecondTabCoordinatorAssembly {
	
	weak var coordinator: ISecondTabCoordinator!
	
	func makeSecondFlowAssembly() -> SecondFlowCoordinatorAssembly {
		SecondFlowCoordinatorAssembly()
	}
	
	func assembly(model: SecondTabViewModel.SceneInput, output: ISecondTabViewOutput) -> SecondTabView {
		SecondTabViewAssembly().assembly(model: model, output: output)
	}
	
	func assemblySecondFlowCoordinator(page: SecondFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> SecondFlowCoordinator {
		let assembly = makeSecondFlowAssembly()
		let coordinator =
		SecondFlowCoordinator(
			page: page,
			navigationManager: navigationManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	
}


