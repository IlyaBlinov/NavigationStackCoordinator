//
//  LoaderFullScreenCoverPresenter.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 19.07.2024.
//

import Foundation

protocol ILoaderPresenter {
	func start(_ state: LoaderModel.Start.State)
}

final class LoaderPresenter: ILoaderPresenter {
	
	var view: ILoader?
	
	func start(_ state: LoaderModel.Start.State) {}
	
	
}
