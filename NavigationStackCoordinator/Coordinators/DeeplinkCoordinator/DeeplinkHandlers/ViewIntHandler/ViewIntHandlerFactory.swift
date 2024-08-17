//
//  ViewIntHandlerFactory.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 13.08.2024.
//

import Foundation

protocol IViewIntHandlerFactory {
	func produce() -> IDeeplinkHandler
}

final class ViewIntHandlerFactory: IViewIntHandlerFactory {
	
	private let navigationManager: NavigationManager
	private let tabBarManager: TabBarManager
	private let deeplinkMapper: IDeeplinkMapper
	
	init(
		navigationManager: NavigationManager,
		tabBarManager: TabBarManager,
		deeplinkMapper: IDeeplinkMapper
	) {
		self.navigationManager = navigationManager
		self.tabBarManager = tabBarManager
		self.deeplinkMapper = deeplinkMapper
	}
	
	func produce() -> IDeeplinkHandler {
		return ViewIntDeeplinkHandler(
			tabBarManager: tabBarManager,
			navigationManager: navigationManager,
			mapper: deeplinkMapper
		)
	}
}
