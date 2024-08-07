//
//  SecondTabAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation

protocol ISecondTabCoordinatorAssembly: AnyObject {
	func assemblySecondTabView(model: SecondTabViewModel.SceneInput) -> SecondTabView
	func assembly(model: SecondTabViewModel.SceneInput, output: ISecondTabViewOutput) -> SecondTabView
	func assemblySecondFlowCoordinator(page: SecondFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> SecondFlowCoordinator
}


final class SecondTabCoordinatorAssembly: ISecondTabCoordinatorAssembly {
	
	private let navigationManager: INavigationManager
	private let tabBarManager: ITabBarManager
	
	weak var coordinator: ISecondTabCoordinator!
	
	init(
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
	}
	
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
	
	func assemblySecondTabView(model: SecondTabViewModel.SceneInput) -> SecondTabView {
		var view = SecondTabView()
		let output = SecondTabCoordinator.SecondTabOutput(coordinator: self.coordinator)
		view.interactor = SecondTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	
	
}


