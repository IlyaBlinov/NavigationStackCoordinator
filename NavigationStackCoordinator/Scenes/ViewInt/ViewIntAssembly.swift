//
//  ViewIntAssembly.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import SwiftUI

protocol IViewIntAssembly: AnyObject {
	func assembly(model: ViewIntModel.SceneInput) -> ViewInt
}


final class ViewIntAssembly: IViewIntAssembly {
	
	func assembly(model: ViewIntModel.SceneInput) -> ViewInt {
		var view = ViewInt()
		let presenter = ViewIntPresenter()
		presenter.view = view
		view.interactor = ViewIntInteractor(output: model.output, presenter: presenter)
		view.store.value = model.value
		return view
	}
}

extension ViewInt {
	func configure(_ model: ViewIntModel.SceneInput) -> some View {
		var view = self
		let presenter = ViewIntPresenter()
		presenter.view = view
		view.interactor = ViewIntInteractor(output: model.output, presenter: presenter)
		view.store.value = model.value
		return view
	}
}
