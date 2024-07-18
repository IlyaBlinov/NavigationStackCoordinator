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
	func assemblySecondFlowCoordinator(pathManager: PathManager, tabBarManager: TabBarManager) -> SecondFlowCoordinator
}


final class FirstFlowCoordinatorAssembly: IFirstFlowCoordinatorAssembly {
	
	weak var coordinator: IFirstFlowCoordinator!
	
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt{
		ViewIntAssembly().assembly(model: model)
	}
	
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble  {
		ViewDoubleAssembly().assembly(model: model)
	}
	
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString  {
		ViewStringAssembly().assembly(model: model)
	}
	
	func assemblySheetCoordinator(sheet: FirstFlowSheetCoordinator.Sheet) -> FirstFlowSheetCoordinator {
		let assembly = FirstFlowSheetCoordinatorAssembly()
		let sheetCoordinator = FirstFlowSheetCoordinator(sheet: sheet, assembly: assembly)
		assembly.coordinator = sheetCoordinator
		return sheetCoordinator
	}
	
	func assemblySecondFlowCoordinator(pathManager: PathManager, tabBarManager: TabBarManager) -> SecondFlowCoordinator {
		let assembly = SecondFlowCoordinatorAssembly()
		let coordinator = SecondFlowCoordinator(
			page: .viewString,
			pathManager: pathManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
}
