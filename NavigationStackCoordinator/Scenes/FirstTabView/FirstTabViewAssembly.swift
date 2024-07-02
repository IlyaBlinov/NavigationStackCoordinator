//
//  FirstTabViewAssembly.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 03.06.2024.
//

import SwiftUI

protocol IFirstTabAssembly: AnyObject {
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView
	func assemblyFirstFlowCoordinator(pathManager: PathManager) -> FirstFlowCoordinator
}


final class FirstTabAssembly: IFirstTabAssembly {
	
	private let mainContainer: MainContainer
	init(mainContainer: MainContainer) {
		self.mainContainer = mainContainer
	}
	
	func makeFirstFlowAssembly() -> FirstFlowAssembly {
		FirstFlowAssembly()
	}
	
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView {
		var view = FirstTabView()
		view.interactor = FirstTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	func assemblyFirstFlowCoordinator(pathManager: PathManager) -> FirstFlowCoordinator {
		FirstFlowCoordinator(
			page: .viewInt,
			pathManager: pathManager,
			assembly: makeFirstFlowAssembly()
		)
	}
	
	func assembly(model: FirstTabViewModel.SceneInput, pathManager: PathManager) -> FirstTabView {
		var view = FirstTabView()
		let coordinator = assemblyFirstFlowCoordinator(pathManager: pathManager)
		let output = FirstFlowCoordinator.FirstTabOutput(coordinator: coordinator)
		view.interactor = FirstTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	
	
}


extension FirstTabView {
	func configure(_ model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> some View {
		var view = self
		view.store.value = model.value
		view.interactor = FirstTabViewInteractor(output: output)
		return view
	}
}
