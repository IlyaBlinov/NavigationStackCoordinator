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
	
	func produce() -> [IDeeplinkHandler] {
		var handlers: [IDeeplinkHandler] = []
		let viewIntHandler = ViewIntHandler(coordinator: coordinator)
		let viewStringHandler = ViewStringHandler(coordinator: coordinator)
		let viewDoubleHandler = ViewDoubleHandler(coordinator: coordinator)
		handlers.append(viewIntHandler)
		handlers.append(viewStringHandler)
		handlers.append(viewDoubleHandler)
		return handlers

	}
}
