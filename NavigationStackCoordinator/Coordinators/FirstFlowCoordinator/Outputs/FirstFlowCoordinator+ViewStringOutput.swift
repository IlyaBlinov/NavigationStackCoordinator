//
//  FirstFlowCoordinator+ViewStringOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation

extension FirstFlowCoordinator {
	
	final class ViewStringOutput: IViewStringOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(SecondFlowCoordinator(page: .viewString, pathManager: pathManager))
		}
		
		
	}
}
