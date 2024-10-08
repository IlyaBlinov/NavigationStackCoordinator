//
//  FirstTabwDeeplinkHandlersFactory.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

protocol IFirstTabDeeplinkHandlersFactory {
	func produce() -> [IDeeplinkHandler]
}


final class FirstTabDeeplinkHandlersFactory: IFirstTabDeeplinkHandlersFactory {
	
	private var navigationManager: NavigationManager
	private var tabBarManager: TabBarManager
	
	init(navigationManager: NavigationManager, tabBarManager: TabBarManager) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
	}
	
	func produce() -> [IDeeplinkHandler] {
		let viewIntHandlerFactory = ViewIntHandlerFactory(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager,
			deeplinkMapper: FirstTabViewIntDeeplinkMapper()
		)
		return [viewIntHandlerFactory.produce()]
	}
	
}
