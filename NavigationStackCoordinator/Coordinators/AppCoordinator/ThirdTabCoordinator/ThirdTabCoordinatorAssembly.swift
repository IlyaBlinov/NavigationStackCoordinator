//
//  ThirdTabCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation

protocol IThirdTabCoordinatorAssembly: AnyObject {
	func assemblyThirdTabView(model: ThirdTabViewModel.SceneInput) -> ThirdTabView
	func assembly(model: ThirdTabViewModel.SceneInput, output: IThirdTabViewOutput) -> ThirdTabView
	func assemblyThirdFlowCoordinator(page: ThirdFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> ThirdFlowCoordinator
}


final class ThirdTabCoordinatorAssembly: IThirdTabCoordinatorAssembly {
	
	private let navigationManager: INavigationManager
	private let tabBarManager: ITabBarManager
	
	weak var coordinator: IThirdTabCoordinator!
	
	init(
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
	}
	
	func makeThirdFlowAssembly() -> ThirdFlowCoordinatorAssembly {
		ThirdFlowCoordinatorAssembly()
	}
	
	func assembly(model: ThirdTabViewModel.SceneInput, output: IThirdTabViewOutput) -> ThirdTabView {
		ThirdTabViewAssembly().assembly(model: model, output: output)
	}
	
	func assemblyThirdFlowCoordinator(page: ThirdFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> ThirdFlowCoordinator {
		let assembly = makeThirdFlowAssembly()
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
	
	func assemblyThirdTabView(model: ThirdTabViewModel.SceneInput) -> ThirdTabView {
		var view = ThirdTabView()
		let output = ThirdTabCoordinator.ThirdTabOutput(coordinator: self.coordinator)
		view.interactor = ThirdTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	
	
}


