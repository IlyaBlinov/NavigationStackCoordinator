//
//  FirstFlowCoordinator+ViewDoubleOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation

extension FirstFlowCoordinator {
	final class ViewDoubleOutput: IViewDoubleOutput {
		
		let coordinator: IFirstFlowCoordinator
		
		
		init(coordinator: IFirstFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showViewString()
		}
		
		func showLoader() {
			coordinator.showLoader()
		}
		
		func hideLoader() {
			coordinator.dismissFullScreenCover()
		}
		
		
	}
}
