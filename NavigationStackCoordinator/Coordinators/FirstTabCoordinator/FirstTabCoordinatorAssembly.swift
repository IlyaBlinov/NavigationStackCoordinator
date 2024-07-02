//
//  FirstTabCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import Foundation
import SwiftUI

protocol IFirstTabCoordinatorAssembly: AnyObject {
	func assemblyFirstTabView(model: FirstTabViewModel.SceneInput) -> FirstTabView
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView
	func assemblyFirstFlowCoordinator() -> FirstFlowCoordinator
}


final class FirstTabCoordinatorAssembly: IFirstTabCoordinatorAssembly {
	
	private let pathManager: PathManager
	private let tabBarManager: TabBarManager
	
	init(pathManager: PathManager, tabBarManager: TabBarManager) {
		self.pathManager = pathManager
		self.tabBarManager = tabBarManager
	}
	
	func makeFirstFlowAssembly() -> FirstFlowCoordinatorAssembly {
		FirstFlowCoordinatorAssembly()
	}
	
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView {
		FirstTabViewAssembly().assembly(model: model, output: output)
	}
	
	func assemblyFirstFlowCoordinator() -> FirstFlowCoordinator {
		FirstFlowCoordinator(
			page: .viewInt,
			pathManager: pathManager,
			assembly: makeFirstFlowAssembly(), 
			tabBarManager: tabBarManager
		)
	}
	
	func assemblyFirstTabView(model: FirstTabViewModel.SceneInput) -> FirstTabView {
		var view = FirstTabView()
		let coordinator = assemblyFirstFlowCoordinator()
		let output = FirstFlowCoordinator.FirstTabOutput(coordinator: coordinator)
		view.interactor = FirstTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	
	
}


