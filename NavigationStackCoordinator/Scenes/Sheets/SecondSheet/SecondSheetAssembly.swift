//
//  SecondSheetAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import Foundation

protocol ISecondSheetAssembly: AnyObject {
	func assembly(model: SecondSheetModel.SceneInput) -> SecondSheet
}


final class SecondSheetAssembly: ISecondSheetAssembly {
	
	func assembly(model: SecondSheetModel.SceneInput) -> SecondSheet {
		var view = SecondSheet()
		let presenter = SecondSheetPresenter()
		presenter.view = view
		view.interactor = SecondSheetInteractor(presenter: presenter)
		view.store.value = model.value
		return view
	}
}
