//
//  FirstTabCoordinator+FirstTabOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 22.07.2024.
//

import Foundation

final class FirstTabOutput: IFirstTabViewOutput {
	let coordinator: IFirstTabCoordinator
	
	
	init(coordinator: IFirstTabCoordinator) {
		self.coordinator = coordinator
	}
	
	func pushNextScreen() {
		coordinator.showFirstFlowCoordinator()
	}
}
