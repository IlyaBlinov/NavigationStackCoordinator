//
//  SecondFlowCoordinator+ViewDoubleOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import Foundation


	final class SecondFlowViewDoubleOutput: IViewDoubleOutput {
		func showLoader() {
			
		}
		
		func hideLoader() {
			
		}
		
		
		let coordinator: ISecondFlowCoordinator
		
		
		init(coordinator: ISecondFlowCoordinator) {
			self.coordinator = coordinator
		}
		
		func pushNextScreen() {
			coordinator.showThirdFlowCoordinatorView()
		}
		
		
	}
