//
//  FirstFlowFullScreenCoverAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 19.07.2024.
//

import Foundation

protocol IFirstFlowFullScreenCoverAssembly: AnyObject {
	func assemblyLoader(_ model: LoaderModel.SceneInput) -> Loader
}


final class FirstFlowFullScreenCoverAssembly: IFirstFlowFullScreenCoverAssembly {
	
	weak var coordinator: IFirstFlowFullScreenCoverCoordinator!
	
	func assemblyLoader(_ model: LoaderModel.SceneInput) -> Loader {
		LoaderAssembly().assembly(model: model)
	}
	
}
