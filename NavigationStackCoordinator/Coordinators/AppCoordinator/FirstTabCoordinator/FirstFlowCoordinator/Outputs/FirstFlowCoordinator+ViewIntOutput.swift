//
//  FirstFlowCoordinator+ViewIntOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation

extension FirstFlowCoordinator {
	final class ViewIntOutput: IViewIntOutput {
		
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
}
