//
//  FirstFlowDeeplinkHandlersFactory.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

final class FirstFlowDeeplinkHandlersFactory {
	
	private let coordinator: IFirstFlowCoordinator
	
	init(coordinator: IFirstFlowCoordinator) {
		self.coordinator = coordinator
	}
	
	func produce(page: FirstFlowCoordinator.Page) -> IDeeplinkHandler {
		switch page {
		case .viewInt:
			let viewStringHandler = ViewIntHandler(coordinator: coordinator)
			return viewStringHandler
		case .viewString:
			let viewStringHandler = ViewStringHandler(coordinator: coordinator)
			return viewStringHandler
		case .viewDouble:
			let viewStringHandler = ViewDoubleHandler(coordinator: coordinator)
			return viewStringHandler
		}
	}
}
