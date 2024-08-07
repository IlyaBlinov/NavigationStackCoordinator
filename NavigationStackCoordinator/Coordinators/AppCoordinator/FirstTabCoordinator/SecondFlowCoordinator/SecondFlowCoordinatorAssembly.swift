//
//  SecondFlowCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 05.07.2024.
//

import Foundation

protocol ISecondFlowCoordinatorAssembly: AnyObject {
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString
	func assemblySheetCoordinator(sheet: SecondFlowSheetCoordinator.Sheet) -> SecondFlowSheetCoordinator
	func assemblyThirdFlowCoordinator(page: ThirdFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> ThirdFlowCoordinator
}


final class SecondFlowCoordinatorAssembly: ISecondFlowCoordinatorAssembly {
	
	weak var coordinator: ISecondFlowCoordinator!
	
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt{
		ViewIntAssembly().assembly(model: model, output: SecondFlowCoordinator.ViewIntOutput(coordinator: self.coordinator))
	}
	
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble  {
		ViewDoubleAssembly().assembly(model: model, output: SecondFlowCoordinator.ViewDoubleOutput(coordinator: self.coordinator))
	}
	
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString  {
		ViewStringAssembly().assembly(model: model, output: SecondFlowCoordinator.ViewStringOutput(coordinator: self.coordinator))
	}
	
	func assemblySheetCoordinator(sheet: SecondFlowSheetCoordinator.Sheet) -> SecondFlowSheetCoordinator {
		let assembly = SecondFlowSheetCoordinatorAssembly()
		let sheetCoordinator = SecondFlowSheetCoordinator(sheet: sheet, assembly: assembly)
		assembly.coordinator = sheetCoordinator
		return sheetCoordinator
		
	}
	
	func assemblyThirdFlowCoordinator(page: ThirdFlowCoordinator.Page, navigationManager: INavigationManager, tabBarManager: ITabBarManager) -> ThirdFlowCoordinator {
		let assembly = ThirdFlowCoordinatorAssembly()
		let coordinator = ThirdFlowCoordinator(
			page: page,
			navigationManager: navigationManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
}
