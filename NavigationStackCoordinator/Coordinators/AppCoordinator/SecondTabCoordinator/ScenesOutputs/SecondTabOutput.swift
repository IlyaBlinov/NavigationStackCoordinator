//
//  SecondTabCoordinator+SecondTabOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

final class SecondTabOutput: ISecondTabViewOutput {
	let coordinator: SecondTabCoordinator
	
	
	init(coordinator: SecondTabCoordinator) {
		self.coordinator = coordinator
	}
	
	func pushNextScreen() {
		coordinator.showSecondFlowCoordinator()
	}
	}
