//
//  FirstTabwDeeplinkHandlersFactory.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

final class FirstTabwDeeplinkHandlersFactory {
	
	let firstFlowDeeplinkHandlersFactory: FirstFlowDeeplinkHandlersFactory
	
	init(firstFlowDeeplinkHandlersFactory: FirstFlowDeeplinkHandlersFactory) {
		self.firstFlowDeeplinkHandlersFactory = firstFlowDeeplinkHandlersFactory
	}
	
	func produce() -> [IDeeplinkHandler] {
		FirstFlowCoordinator.Page.allCases.map { page in
			firstFlowDeeplinkHandlersFactory.produce(page: page)
		}
		
	}
	
}
