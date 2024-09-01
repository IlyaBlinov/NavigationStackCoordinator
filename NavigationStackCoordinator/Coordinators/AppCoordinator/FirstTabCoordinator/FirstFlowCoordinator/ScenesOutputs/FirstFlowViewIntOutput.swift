//
//  FirstFlowCoordinator+ViewIntOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation


final class FirstFlowViewIntOutput: IViewIntOutput {
	
	let coordinator: IFirstFlowCoordinator
	
	init(coordinator: IFirstFlowCoordinator) {
		self.coordinator = coordinator
	}
	
	func pushNextScreen() {
		coordinator.showViewDouble()
	}
	
	func presentFirstSheet() {
		coordinator.showFirstSheet()
	}
	
	}
