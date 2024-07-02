//
//  FirstFlowCoordinator+ViewDoubleOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation

extension FirstFlowCoordinator {
	final class ViewDoubleOutput: IViewDoubleOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(FirstFlowCoordinator(page: .viewString, pathManager: pathManager))
		}
		
		
	}
}
