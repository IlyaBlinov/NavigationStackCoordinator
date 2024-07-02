//
//  FirstTabViewAssembly.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 03.06.2024.
//

import SwiftUI

protocol IFirstTabViewAssembly: AnyObject {
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView
}


final class FirstTabViewAssembly: IFirstTabViewAssembly {
	
	func assembly(model: FirstTabViewModel.SceneInput, output: IFirstTabViewOutput) -> FirstTabView {
		var view = FirstTabView()
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
