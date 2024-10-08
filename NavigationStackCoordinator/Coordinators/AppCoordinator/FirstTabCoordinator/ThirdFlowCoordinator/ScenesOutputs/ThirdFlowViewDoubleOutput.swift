//
//  ThirdFlowCoordinator+ViewDoubleOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation

	final class ThirdFlowViewDoubleOutput: IViewDoubleOutput {
		
		let coordinator: IThirdFlowCoordinator
		
		
		init(coordinator: IThirdFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showFirstFlowCoordinatorView()
		}
		
		func showLoader() {}
		
		func hideLoader() {}
		
		
	}

