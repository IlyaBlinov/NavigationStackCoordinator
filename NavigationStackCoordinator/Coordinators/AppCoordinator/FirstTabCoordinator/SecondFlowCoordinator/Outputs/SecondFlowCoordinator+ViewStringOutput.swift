//
//  SecondFlowCoordinator+ViewStringOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import Foundation

extension SecondFlowCoordinator {
	
	final class ViewStringOutput: IViewStringOutput {
		
		let coordinator: ISecondFlowCoordinator
		
		
		init(coordinator: ISecondFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showViewInt()
		}
	}
}
