//
//  SecondSheetInteractor.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import Foundation

protocol ISecondSheetInteractor: AnyObject {
	func start(_ event: SecondSheetModel.Start.Event)
	func dismiss(_ event: SecondSheetModel.Dismiss.Event)
}


final class SecondSheetInteractor: ISecondSheetInteractor {
	
	private let presenter: ISecondSheetPresenter
	
	init(presenter: ISecondSheetPresenter) {
		self.presenter = presenter
	}
	
	func start(_ event: SecondSheetModel.Start.Event) {}
	
	func dismiss(_ event: SecondSheetModel.Dismiss.Event) {}
	
	
	
}
