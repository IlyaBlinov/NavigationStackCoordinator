//
//  ViewDoubleInteractor.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 14.06.2024.
//

import Foundation

protocol IViewDoubleInteractor: AnyObject {
	func start()
	func pushNextScreen()
	func requestToServer()
}


final class ViewDoubleInteractor: IViewDoubleInteractor {
	
	private let output: IViewDoubleOutput
	
	init(output: IViewDoubleOutput) {
		self.output = output
	}
	
	func start() {}
	
	func pushNextScreen() {
		output.pushNextScreen()
	}
	
	private func showLoader() {
		output.showLoader()
	}
	
	private func hideLoader() {
		output.hideLoader()
	}
	
	func requestToServer() {
		showLoader()
		// REQUEST.........
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
			self.hideLoader()
		}
	}
	
}
