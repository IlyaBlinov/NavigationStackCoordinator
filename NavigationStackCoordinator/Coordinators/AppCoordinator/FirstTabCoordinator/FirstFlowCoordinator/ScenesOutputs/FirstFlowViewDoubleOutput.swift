//
//  FirstFlowCoordinator+ViewDoubleOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation

	final class FirstFlowViewDoubleOutput: IViewDoubleOutput {
		
		let coordinator: IFirstFlowCoordinator
		
		
		init(coordinator: IFirstFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showSecondFlowCoordinatorView()
		}
		
		func showLoader() {
			coordinator.showLoader()
		}
		
		func hideLoader() {
			coordinator.hideLoader()
		}
		
		
	}

