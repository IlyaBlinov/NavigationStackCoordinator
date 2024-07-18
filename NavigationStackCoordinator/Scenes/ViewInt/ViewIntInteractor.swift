//
//  ViewIntInteractor.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import Foundation

protocol IViewIntInteractor: AnyObject {
	func start(_ event: ViewIntModel.Start.Event)
	func changeValue(_ event: ViewIntModel.ChangeValue.Event)
	func pushNextScreen()
	func showSheet(_ event: ViewIntModel.ShowSheet.Event)
}


final class ViewIntInteractor: IViewIntInteractor {
	
	private let output: IViewIntOutput
	
	private let presenter: IViewIntPresenter
	
	init(output: IViewIntOutput, presenter: IViewIntPresenter) {
		self.output = output
		self.presenter = presenter
	}
	
	func start(_ event: ViewIntModel.Start.Event) {}
	
	func changeValue(_ event: ViewIntModel.ChangeValue.Event) {
		presenter.changeValue(ViewIntModel.ChangeValue.State(value: event.value))
	}
	
	func pushNextScreen() {
		output.pushNextScreen()
	}
	
	func showSheet(_ event: ViewIntModel.ShowSheet.Event) {
		output.presentFirstSheet()
	}
	
}
