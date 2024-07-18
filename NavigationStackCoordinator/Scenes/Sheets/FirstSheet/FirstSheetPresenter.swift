//
//  FirstSheetPresenter.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import Foundation

protocol IFirstSheetPresenter {
	func start(_ state: FirstSheetModel.Start.State)
}

final class FirstSheetPresenter: IFirstSheetPresenter {
	
	var view: IFirstSheet?
	
	func start(_ state: FirstSheetModel.Start.State) {}
	

}
