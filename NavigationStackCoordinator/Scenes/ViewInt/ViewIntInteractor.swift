//
//  ViewIntInteractor.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import Foundation

protocol IViewIntInteractor: AnyObject {
	func start()
	func pushNextScreen()
}


final class ViewIntInteractor: IViewIntInteractor {
	
	private let output: IViewIntOutput
	
	init(output: IViewIntOutput) {
		self.output = output
	}
	
	func start() {}
	
	func pushNextScreen() {
		output.pushNextScreen()
	}
	
}
