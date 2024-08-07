//
//  FirstFlowAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import SwiftUI

protocol IFirstFlowCoordinatorAssembly: AnyObject {
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString
	func assemblySheetCoordinator(sheet: FirstFlowSheetCoordinator.Sheet) -> FirstFlowSheetCoordinator
	func assemblyFullScreenCoverCoordinator(fullScreenCover: FirstFlowFullScreenCoverCoordinator.FullScreenCover) -> FirstFlowFullScreenCoverCoordinator
	func assemblySecondFlowCoordinator(page: SecondFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> SecondFlowCoordinator
}


final class FirstFlowCoordinatorAssembly: IFirstFlowCoordinatorAssembly {
	
	weak var coordinator: IFirstFlowCoordinator!
	
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt {
		ViewIntAssembly().assembly(model: model, output: FirstFlowCoordinator.ViewIntOutput(coordinator: coordinator))
	}
	
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble {
		ViewDoubleAssembly().assembly(model: model, output: FirstFlowCoordinator.ViewDoubleOutput(coordinator: coordinator))
	}
	
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString {
		ViewStringAssembly().assembly(model: model, output: FirstFlowCoordinator.ViewStringOutput(coordinator: coordinator))
	}
	
	func assemblySheetCoordinator(sheet: FirstFlowSheetCoordinator.Sheet) -> FirstFlowSheetCoordinator {
		let assembly = FirstFlowSheetCoordinatorAssembly()
		let coordinator = FirstFlowSheetCoordinator(sheet: sheet, assembly: assembly)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	func assemblyFullScreenCoverCoordinator(fullScreenCover: FirstFlowFullScreenCoverCoordinator.FullScreenCover) -> FirstFlowFullScreenCoverCoordinator {
		let assembly = FirstFlowFullScreenCoverAssembly()
		let coordinator = FirstFlowFullScreenCoverCoordinator(fullScreenCover: fullScreenCover, assembly: assembly)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	func assemblySecondFlowCoordinator(
		page: SecondFlowCoordinator.Page,
		navigationManager: INavigationManager,
		tabBarManager: ITabBarManager
	) -> SecondFlowCoordinator {
		let assembly = SecondFlowCoordinatorAssembly()
		let coordinator = SecondFlowCoordinator(
			page: page,
			navigationManager: navigationManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
}
