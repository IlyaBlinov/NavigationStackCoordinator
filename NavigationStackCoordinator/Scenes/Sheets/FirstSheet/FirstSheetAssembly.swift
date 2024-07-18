//
//  FirstSheetAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import Foundation

protocol IFirstSheetAssembly: AnyObject {
	func assembly(model: FirstSheetModel.SceneInput) -> FirstSheet
}


final class FirstSheetAssembly: IFirstSheetAssembly {
	
	func assembly(model: FirstSheetModel.SceneInput) -> FirstSheet {
		var view = FirstSheet()
		let presenter = FirstSheetPresenter()
		presenter.view = view
		view.interactor = FirstSheetInteractor(presenter: presenter)
		view.store.value = model.value
		return view
	}
}
