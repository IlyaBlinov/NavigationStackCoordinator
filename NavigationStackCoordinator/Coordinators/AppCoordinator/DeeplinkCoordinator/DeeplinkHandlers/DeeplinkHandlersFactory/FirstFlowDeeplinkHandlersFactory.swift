//
//  FirstFlowDeeplinkHandlersFactory.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

final class FirstFlowDeeplinkHandlersFactory {
	
	private let mainContainer: MainContainer
	
	init(mainContainer: MainContainer) {
		self.mainContainer = mainContainer
	}
	
	func produce(page: FirstFlowCoordinator.Page) -> IDeeplinkHandler {
		let firstFlowCoordinator = self.mainContainer.makeFirstTabCoordinatorAssembly().assemblyFirstFlowCoordinator()
		
		switch page {
		case .viewInt:
			let viewStringHandler = ViewIntHandler(coordinator: firstFlowCoordinator)
			return viewStringHandler
		case .viewString:
			let viewStringHandler = ViewStringHandler(coordinator: firstFlowCoordinator)
			return viewStringHandler
		case .viewDouble:
			let viewStringHandler = ViewDoubleHandler(coordinator: firstFlowCoordinator)
			return viewStringHandler
		}
	}
}
