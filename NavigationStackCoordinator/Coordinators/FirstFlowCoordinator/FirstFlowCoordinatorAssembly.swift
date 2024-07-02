//
//  FirstFlowAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import SwiftUI

protocol IFirstFlowAssembly {
	func assemblyViewInt(_ model: ViewIntModel.SceneInput, output: IViewIntOutput) -> ViewInt
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput, output: IViewDoubleOutput) -> ViewDouble
	func assemblyString(_ model: ViewStringModel.SceneInput, output: IViewStringOutput) -> ViewString
	func assemblyFirstTab(_ model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView
}


final class FirstFlowAssembly: IFirstFlowAssembly {
	func assemblyViewInt(_ model: ViewIntModel.SceneInput, output: IViewIntOutput) -> ViewInt {
		ViewIntAssembly().assembly(model: model, output: output)
	}
	
	func assemblyViewDouble(_ model: ViewDoubleModel.SceneInput, output: IViewDoubleOutput) -> ViewDouble  {
		ViewDoubleAssembly().assembly(model: model, output: output)
	}
	
	func assemblyString(_ model: ViewStringModel.SceneInput, output: IViewStringOutput) -> ViewString  {
		ViewStringAssembly().assembly(model: model, output: output)
	}
	
	func assemblyFirstTab(_ model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView {
		FirstTabAssembly().assembly(model: model, output: output)
	}
}
