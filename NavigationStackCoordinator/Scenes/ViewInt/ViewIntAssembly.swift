//
//  ViewIntAssembly.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import SwiftUI

protocol IViewIntAssembly: AnyObject {
	func assembly(model: ViewIntModel.SceneInput, output: IViewIntOutput) -> ViewInt
}


final class ViewIntAssembly: IViewIntAssembly {
	
	func assembly(model: ViewIntModel.SceneInput, output: IViewIntOutput) -> ViewInt {
		var view = ViewInt()
		let presenter = ViewIntPresenter()
		presenter.view = view
		view.interactor = ViewIntInteractor(output: output, presenter: presenter)
		view.store.value = model.value
		return view
	}
}

