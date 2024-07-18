//
//  FirstSheetInteractor.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import Foundation

protocol IFirstSheetInteractor: AnyObject {
	func start(_ event: FirstSheetModel.Start.Event)
	func dismiss(_ event: FirstSheetModel.Dismiss.Event)
}


final class FirstSheetInteractor: IFirstSheetInteractor {
	
	private let presenter: IFirstSheetPresenter
	
	init(presenter: IFirstSheetPresenter) {
		self.presenter = presenter
	}
	
	func start(_ event: FirstSheetModel.Start.Event) {}
	
	func dismiss(_ event: FirstSheetModel.Dismiss.Event) {
		
	}
	
	
	
}
