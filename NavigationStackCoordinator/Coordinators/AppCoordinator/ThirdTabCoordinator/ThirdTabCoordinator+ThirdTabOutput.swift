//
//  ThirdTabCoordinator+ThirdTabOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import Foundation

extension ThirdTabCoordinator {
	final class ThirdTabOutput: IThirdTabViewOutput {
		let coordinator: IThirdTabCoordinator
		
		
		init(coordinator: IThirdTabCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showViewString()
		}
	}
}
