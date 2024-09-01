//
//  FirstFlowCoordinator+ViewStringOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation
	
	final class FirstFlowViewStringOutput: IViewStringOutput {
		
		let coordinator: IFirstFlowCoordinator
		
		init(coordinator: IFirstFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showSecondFlowCoordinatorView()
		}
		
		
	}

