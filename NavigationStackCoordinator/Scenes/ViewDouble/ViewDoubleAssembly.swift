//
//  ViewDoubleAssembly.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 16.06.2024.
//

import SwiftUI

protocol IViewDoubleAssembly: AnyObject {
	func assembly(model: ViewDoubleModel.SceneInput, output: IViewDoubleOutput) -> ViewDouble
}


final class ViewDoubleAssembly: IViewDoubleAssembly {
	func assembly(model: ViewDoubleModel.SceneInput, output: IViewDoubleOutput) -> ViewDouble {
		var view = ViewDouble()
		view.interactor = ViewDoubleInteractor(output: output)
		view.store.value = model.value
		return view
	}
}

extension ViewDouble {
	func configure(_ model: ViewDoubleModel.SceneInput, output: IViewDoubleOutput) -> some View {
		var view = self
		view.interactor = ViewDoubleInteractor(output: output)
		view.store.value = model.value
		return view
	}
}
