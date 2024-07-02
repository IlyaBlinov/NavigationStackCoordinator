//
//  FirstTabViewInteractor.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import Foundation

protocol IFirstTabViewInteractor: AnyObject {
	func start()
	func pushNextScreen()
}


final class FirstTabViewInteractor: IFirstTabViewInteractor {
	
	private let output: IFirstTabViewOutput
	
	init(output: IFirstTabViewOutput) {
		self.output = output
	}
	
	func start() {}
	
	func pushNextScreen() {
		output.pushNextScreen()
	}
}
