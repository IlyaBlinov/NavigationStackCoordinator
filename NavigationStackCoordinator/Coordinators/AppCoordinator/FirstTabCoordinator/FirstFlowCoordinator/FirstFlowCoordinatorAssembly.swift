//
//  FirstFlowAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import SwiftUI

protocol IFirstFlowCoordinatorAssembly {
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput, output: IViewDoubleOutput) -> ViewDouble
	func assemblyString(_ model: ViewStringModel.SceneInput, output: IViewStringOutput) -> ViewString
}


final class FirstFlowCoordinatorAssembly: IFirstFlowCoordinatorAssembly {
	
	weak var coordinator: FirstFlowCoordinator!
	
	func assemblyViewInt(_ model: ViewIntModel.SceneInput) -> ViewInt{
		ViewIntAssembly().assembly(model: model)
	}
	
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput, output: IViewDoubleOutput) -> ViewDouble  {
		ViewDoubleAssembly().assembly(model: model, output: output)
	}
	
	func assemblyString(_ model: ViewStringModel.SceneInput, output: IViewStringOutput) -> ViewString  {
		ViewStringAssembly().assembly(model: model, output: output)
	}
	
}
