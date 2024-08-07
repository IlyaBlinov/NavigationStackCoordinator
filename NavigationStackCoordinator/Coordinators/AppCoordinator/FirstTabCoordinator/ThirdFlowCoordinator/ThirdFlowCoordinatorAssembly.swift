//
//  ThirdFlowCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation

protocol IThirdFlowCoordinatorAssembly: AnyObject {
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString
	func assemblyFirstFlowCoordinator(page: FirstFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> FirstFlowCoordinator
}


final class ThirdFlowCoordinatorAssembly: IThirdFlowCoordinatorAssembly {
	
	weak var coordinator: IThirdFlowCoordinator!
	
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt{
		ViewIntAssembly().assembly(model: model, output: ThirdFlowCoordinator.ViewIntOutput(coordinator: self.coordinator))
	}
	
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble  {
		ViewDoubleAssembly().assembly(model: model, output: ThirdFlowCoordinator.ViewDoubleOutput(coordinator: self.coordinator))
	}
	
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString  {
		ViewStringAssembly().assembly(model: model, output: ThirdFlowCoordinator.ViewStringOutput(coordinator: self.coordinator))
	}
	
	func assemblyFirstFlowCoordinator(page: FirstFlowCoordinator.Page, navigationManager: INavigationManager,tabBarManager: ITabBarManager) -> FirstFlowCoordinator {
		let assembly = FirstFlowCoordinatorAssembly()
		let coordinator = FirstFlowCoordinator(
			page: page,
			navigationManager: navigationManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	
	
}
