//
//  SecondTabViewAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

protocol ISecondTabViewAssembly: AnyObject {
	func assembly(model: SecondTabViewModel.SceneInput, output: ISecondTabViewOutput) -> SecondTabView
}


final class SecondTabViewAssembly: ISecondTabViewAssembly {
	
	func assembly(model: SecondTabViewModel.SceneInput, output: ISecondTabViewOutput) -> SecondTabView {
		var view = SecondTabView()
		view.interactor = SecondTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
}
