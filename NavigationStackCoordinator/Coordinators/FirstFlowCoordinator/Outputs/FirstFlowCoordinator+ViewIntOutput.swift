//
//  FirstFlowCoordinator+ViewIntOutput.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 28.06.2024.
//

import Foundation

extension FirstFlowCoordinator {
	final class ViewIntOutput: IViewIntOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(FirstFlowCoordinator(page: .viewDouble, pathManager: pathManager))
		}
		
		
	}
}
