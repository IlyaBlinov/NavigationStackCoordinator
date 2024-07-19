//
//  LoaderFullScreenCoverAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 19.07.2024.
//

import Foundation

protocol ILoaderAssembly: AnyObject {
	func assembly(model: LoaderModel.SceneInput) -> Loader
}


final class LoaderAssembly: ILoaderAssembly {
	
	func assembly(model: LoaderModel.SceneInput) -> Loader {
		var view = Loader()
		let presenter = LoaderPresenter()
		presenter.view = view
		view.interactor = LoaderInteractor(presenter: presenter)
		return view
	}
}
