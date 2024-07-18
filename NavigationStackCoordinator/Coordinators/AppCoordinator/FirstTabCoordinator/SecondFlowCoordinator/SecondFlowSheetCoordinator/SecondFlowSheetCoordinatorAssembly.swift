//
//  SecondFlowSheetCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import Foundation


protocol ISecondFlowSheetCoordinatorAssembly: AnyObject {
	func assemblyFirstSheet(_ model: FirstSheetModel.SceneInput) -> FirstSheet
	func assemblySecondSheet(_ model: SecondSheetModel.SceneInput) -> SecondSheet
}


final class SecondFlowSheetCoordinatorAssembly: ISecondFlowSheetCoordinatorAssembly {
	
	weak var coordinator: ISecondFlowSheetCoordinator!
	
	func assemblyFirstSheet(_ model: FirstSheetModel.SceneInput) -> FirstSheet {
		FirstSheetAssembly().assembly(model: model)
	}
	
	func assemblySecondSheet(_ model: SecondSheetModel.SceneInput) -> SecondSheet {
		SecondSheetAssembly().assembly(model: model)
	}
	
}
