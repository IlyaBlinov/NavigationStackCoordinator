//
//  SecondFlowCoordinator+ViewIntOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import Foundation

extension SecondFlowCoordinator {
	final class ViewIntOutput: IViewIntOutput {
		
		let coordinator: ISecondFlowCoordinator
		
		
		init(coordinator: ISecondFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showViewDouble()
		}
		
		func presentFirstSheet() {
			coordinator.showSecondSheet()
		}
		
	}
}
