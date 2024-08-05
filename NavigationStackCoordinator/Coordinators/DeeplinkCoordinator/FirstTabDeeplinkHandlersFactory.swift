//
//  FirstTabwDeeplinkHandlersFactory.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

final class FirstTabDeeplinkHandlersFactory {
	
	private let firstFlowDeeplinkHandlersFactory: FirstFlowDeeplinkHandlersFactory
	
	init(firstFlowDeeplinkHandlersFactory: FirstFlowDeeplinkHandlersFactory) {
		self.firstFlowDeeplinkHandlersFactory = firstFlowDeeplinkHandlersFactory
	}
	
	func produce() -> [IDeeplinkHandler] {
		var handlers: [IDeeplinkHandler] = []
		let firstFlowHandlers = firstFlowDeeplinkHandlersFactory.produce()
		handlers.append(contentsOf: firstFlowHandlers)
		return handlers
	}
	
}
