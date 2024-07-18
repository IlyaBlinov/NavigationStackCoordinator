//
//  SecondSheetPresenter.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import Foundation

protocol ISecondSheetPresenter {
	func start(_ state: SecondSheetModel.Start.State)
}

final class SecondSheetPresenter: ISecondSheetPresenter {
	
	var view: ISecondSheet?
	
	func start(_ state: SecondSheetModel.Start.State) {}
	
	
}
