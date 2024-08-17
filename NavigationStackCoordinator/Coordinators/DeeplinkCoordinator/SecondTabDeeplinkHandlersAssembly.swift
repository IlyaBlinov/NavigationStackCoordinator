//
//  SecondTabDeeplinkHandlersAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 10.08.2024.
//

import Foundation

protocol ISecondTabDeeplinkHandlersFactory {
	func produce() -> [IDeeplinkHandler]
}

final class SecondTabDeeplinkHandlersFactory: ISecondTabDeeplinkHandlersFactory {
	
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
			deeplinkMapper: SecondTabViewIntDeeplinkMapper()
		)
		return [viewIntHandlerFactory.produce()]
	}
}
