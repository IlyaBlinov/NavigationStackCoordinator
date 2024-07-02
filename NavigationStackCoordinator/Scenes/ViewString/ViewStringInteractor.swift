//
//  ViewStringInteractor.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 14.06.2024.
//

import Foundation


protocol IViewStringInteractor: AnyObject {
	func start()
	func pushNextScreen()
}


final class ViewStringInteractor: IViewStringInteractor {
	
	private let output: IViewStringOutput
	
	init(output: IViewStringOutput) {
		self.output = output
	}
	
	func start() {}
	
	func pushNextScreen() {
		output.pushNextScreen()
	}
	
}
