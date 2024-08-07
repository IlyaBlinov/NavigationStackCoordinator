//
//  ThirdTabViewInteractor.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

protocol IThirdTabViewInteractor: AnyObject {
	func start()
	func pushNextScreen()
}


final class ThirdTabViewInteractor: IThirdTabViewInteractor {
	
	private let output: IThirdTabViewOutput
	
	init(output: IThirdTabViewOutput) {
		self.output = output
	}
	
	func start() {}
	
	func pushNextScreen() {
		output.pushNextScreen()
	}
}
