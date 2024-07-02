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
		view.interactor = ViewIntInteractor(output: output)
		view.store.value = model.value
		return view
	}
	
	
	
}

extension ViewInt {
	func configure(_ model: ViewIntModel.SceneInput, output: IViewIntOutput) -> some View {
		var view = self
		view.interactor = ViewIntInteractor(output: output)
		view.store.value = model.value
		return view
	}
}
