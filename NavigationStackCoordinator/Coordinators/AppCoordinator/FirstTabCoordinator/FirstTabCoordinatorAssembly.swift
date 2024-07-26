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
	
	private let navigationManager: NavigationManager
	private let tabBarManager: TabBarManager
	
	weak var coordinator: IFirstTabCoordinator!
	
	init(
		navigationManager: NavigationManager,
		tabBarManager: TabBarManager
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
	}
	
	func makeFirstFlowAssembly() -> FirstFlowCoordinatorAssembly {
		FirstFlowCoordinatorAssembly()
	}
	
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView {
		FirstTabViewAssembly().assembly(model: model, output: output)
	}
	
	func assemblyFirstFlowCoordinator() -> FirstFlowCoordinator {
		let assembly = makeFirstFlowAssembly()
		let coordinator =
		FirstFlowCoordinator(
			page: .viewInt,
			navigationManager: navigationManager,
			assembly: assembly,
			tabBarManager: tabBarManager
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	func assemblyFirstTabView(model: FirstTabViewModel.SceneInput) -> FirstTabView {
		var view = FirstTabView()
		//let coordinator = assemblyFirstFlowCoordinator()
		let output = FirstTabCoordinator.FirstTabOutput(coordinator: self.coordinator)
		view.interactor = FirstTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	
	
}


