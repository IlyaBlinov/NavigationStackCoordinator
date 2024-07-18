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
}


final class SecondFlowCoordinatorAssembly: ISecondFlowCoordinatorAssembly {
	
	weak var coordinator: ISecondFlowCoordinator!
	
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt{
		ViewIntAssembly().assembly(model: model)
	}
	
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput) -> ViewDouble  {
		ViewDoubleAssembly().assembly(model: model)
	}
	
	func assemblyString(_ model: ViewStringModel.SceneInput) -> ViewString  {
		ViewStringAssembly().assembly(model: model)
	}
	
	func assemblySheetCoordinator(sheet: SecondFlowSheetCoordinator.Sheet) -> SecondFlowSheetCoordinator {
		let assembly = SecondFlowSheetCoordinatorAssembly()
		let sheetCoordinator = SecondFlowSheetCoordinator(sheet: sheet, assembly: assembly)
		assembly.coordinator = sheetCoordinator
		return sheetCoordinator
		
	}
	
}
