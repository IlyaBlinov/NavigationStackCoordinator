//
//  ViewIntPresenter.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 03.07.2024.
//

import Foundation

protocol IViewIntPresenter {
	func start(_ state: ViewIntModel.Start.State)
	func changeValue(_ state: ViewIntModel.ChangeValue.State)
	func showSheet(_ event: ViewIntModel.ShowSheet.State)
}

final class ViewIntPresenter: IViewIntPresenter {
	
	var view: IViewInt?
	
	func start(_ state: ViewIntModel.Start.State) {}
	
	func changeValue(_ state: ViewIntModel.ChangeValue.State) {
		view?.changeValue(ViewIntModel.ChangeValue.Props(value: state.value))
	}
	
	func showSheet(_ event: ViewIntModel.ShowSheet.State) {
		view?.showSheet(ViewIntModel.ShowSheet.Props())
	}
}
