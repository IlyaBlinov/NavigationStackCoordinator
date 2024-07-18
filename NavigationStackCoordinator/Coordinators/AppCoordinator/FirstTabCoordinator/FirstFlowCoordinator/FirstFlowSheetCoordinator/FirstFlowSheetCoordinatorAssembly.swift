//
//  FirstFlowSheetCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import Foundation

protocol IFirstFlowSheetCoordinatorAssembly: AnyObject {
	func assemblyFirstSheet(_ model: FirstSheetModel.SceneInput) -> FirstSheet
	func assemblySecondSheet(_ model: SecondSheetModel.SceneInput) -> SecondSheet
}


final class FirstFlowSheetCoordinatorAssembly: IFirstFlowSheetCoordinatorAssembly {
	
	weak var coordinator: IFirstFlowSheetCoordinator!
	
	func assemblyFirstSheet(_ model: FirstSheetModel.SceneInput) -> FirstSheet {
		FirstSheetAssembly().assembly(model: model)
	}
	
	func assemblySecondSheet(_ model: SecondSheetModel.SceneInput) -> SecondSheet {
		SecondSheetAssembly().assembly(model: model)
	}
	
}
