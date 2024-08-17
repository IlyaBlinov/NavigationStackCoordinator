//
//  SecondTabCoordinator+SecondTabOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

extension SecondTabCoordinator {
	final class SecondTabOutput: ISecondTabViewOutput {
		let coordinator: ISecondTabCoordinator
		
		
		init(coordinator: ISecondTabCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showViewString()
		}
	}
}
