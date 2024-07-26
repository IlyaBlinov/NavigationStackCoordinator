//
//  ViewStringAssembly.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 03.06.2024.
//

import Foundation
import SwiftUI

protocol IViewStringAssembly: AnyObject {
	func assembly(model: ViewStringModel.SceneInput, output: IViewStringOutput) -> ViewString
}


final class ViewStringAssembly: IViewStringAssembly {
	func assembly(model: ViewStringModel.SceneInput, output: IViewStringOutput) -> ViewString {
		var view = ViewString()
		view.interactor = ViewStringInteractor(output: output)
		view.store.value = model.value
		return view
	}
}
