//
//  FirstFlowCoordinator+FirstTabOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation

extension FirstFlowCoordinator {
	final class FirstTabOutput: IFirstTabViewOutput {
		let coordinator: FirstFlowCoordinator
		
		
		init(coordinator: FirstFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showViewInt()
		}
	}
}
