//
//  ThirdTabViewAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

protocol IThirdTabViewAssembly: AnyObject {
	func assembly(model: ThirdTabViewModel.SceneInput, output: IThirdTabViewOutput) -> ThirdTabView
}


final class ThirdTabViewAssembly: IThirdTabViewAssembly {
	
	func assembly(model: ThirdTabViewModel.SceneInput, output: IThirdTabViewOutput) -> ThirdTabView {
		var view = ThirdTabView()
		view.interactor = ThirdTabViewInteractor(output: output)
		view.store.value = model.value
		return view
	}
}
