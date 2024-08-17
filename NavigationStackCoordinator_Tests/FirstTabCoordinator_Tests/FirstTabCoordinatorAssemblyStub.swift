//
//  FirstTabCoordinatorAssemblyStub.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 04.08.2024.
//

import Foundation
@testable import NavigationStackCoordinator

final class FirstTabCoordinatorAssemblyStub: IFirstTabCoordinatorAssembly {
	
	private let navigationManager: INavigationManager
	private let tabBarManager: ITabBarManager
	
	weak var coordinator: IFirstTabCoordinator!
	
	init(
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
	}
	
	
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView {
		FirstTabViewAssembly().assembly(model: model, output: output)
	}
	
	func assemblyFirstFlowCoordinator() -> FirstFlowCoordinator {
		FirstFlowCoordinator(
			page: .viewInt,
			navigationManager: navigationManager,
			assembly: FirstFlowCoordinatorAssembly(),
			tabBarManager: tabBarManager
		)
	}
	
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
	
	func assemblyFirstTabView(model: FirstTabViewModel.SceneInput) -> FirstTabView {
		FirstTabView()
	}
	
	
	
}
