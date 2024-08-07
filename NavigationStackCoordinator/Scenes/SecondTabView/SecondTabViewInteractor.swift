//
//  SecondTabViewInteractor.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

protocol ISecondTabViewInteractor: AnyObject {
	func start()
	func pushNextScreen()
}


final class SecondTabViewInteractor: ISecondTabViewInteractor {
	
	private let output: ISecondTabViewOutput
	
	init(output: ISecondTabViewOutput) {
		self.output = output
	}
	
	func start() {}
	
	func pushNextScreen() {
		output.pushNextScreen()
	}
}
