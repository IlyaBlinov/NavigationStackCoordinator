//
//  FirstTabCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import Foundation
import SwiftUI

protocol IFirstTabCoordinatorAssembly: AnyObject {
	func assemblyFirstTabView(model: FirstTabViewModel.SceneInput) -> FirstTabView
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView
	func assemblyFirstFlowCoordinator(page: FirstFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> FirstFlowCoordinator
}


final class FirstTabCoordinatorAssembly: IFirstTabCoordinatorAssembly {
	
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
	
	func makeFirstFlowAssembly() -> FirstFlowCoordinatorAssembly {
		FirstFlowCoordinatorAssembly()
	}
	
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView {
		FirstTabViewAssembly().assembly(model: model, output: output)
	}
	
	func assemblyFirstFlowCoordinator(page: FirstFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> FirstFlowCoordinator {
		let assembly = makeFirstFlowAssembly()
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
		var view = FirstTabView()
		let output = FirstTabCoordinator.FirstTabOutput(coordinator: self.coordinator)
		view.interactor = FirstTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	
	
}


