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
	
}
