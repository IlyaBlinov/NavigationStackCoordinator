//
//  LoaderFullScreenCoverInteractor.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 19.07.2024.
//

import Foundation

protocol ILoaderInteractor: AnyObject {
	func start(_ event: LoaderModel.Start.Event)
}


final class LoaderInteractor: ILoaderInteractor {
	
	private let presenter: ILoaderPresenter
	
	init(presenter: ILoaderPresenter) {
		self.presenter = presenter
	}
	
	func start(_ event: LoaderModel.Start.Event) {}
	
}
