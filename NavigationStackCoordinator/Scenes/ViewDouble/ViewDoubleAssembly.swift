//
//  ViewDoubleAssembly.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 16.06.2024.
//

import SwiftUI

protocol IViewDoubleAssembly: AnyObject {
	func assembly(model: ViewDoubleModel.SceneInput) -> ViewDouble
}


final class ViewDoubleAssembly: IViewDoubleAssembly {
	func assembly(model: ViewDoubleModel.SceneInput) -> ViewDouble {
		var view = ViewDouble()
		view.interactor = ViewDoubleInteractor(output: model.output)
		view.store.value = model.value
		return view
	}
}

extension ViewDouble {
	func configure(_ model: ViewDoubleModel.SceneInput) -> some View {
		var view = self
		view.interactor = ViewDoubleInteractor(output: model.output)
		view.store.value = model.value
		return view
	}
}
