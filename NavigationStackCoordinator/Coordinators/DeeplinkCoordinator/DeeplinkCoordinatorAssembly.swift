//
//  DeeplinkCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.08.2024.
//

import Foundation

protocol IDeeplinkCoordinatorAssembly {
	func assemblyDeeplinkHandlers() -> [IDeeplinkHandler] 
}

final class DeeplinkCoordinatorAssembly: IDeeplinkCoordinatorAssembly {
	
	private let mainContainer: MainContainer
	
	init(mainContainer: MainContainer) {
		self.mainContainer = mainContainer
	}
	
	func assemblyDeeplinkHandlers() -> [IDeeplinkHandler] {
		return [self.assemblyFirstTabHandlers(), self.assemblySecondTabHandlers()].flatMap { $0 }
	}
	
	func assemblyFirstTabHandlers() -> [IDeeplinkHandler] {
		
		let navigationManager = NavigationManager(navigation: mainContainer.firstTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let firstTabDeeplinkHandlersFactory = FirstTabDeeplinkHandlersFactory(navigationManager: navigationManager, tabBarManager: tabBarManager)
		let firstFlowHandlers = firstTabDeeplinkHandlersFactory.produce()
		return firstFlowHandlers
	}
	
	func assemblySecondTabHandlers() -> [IDeeplinkHandler] {
		let navigationManager = NavigationManager(navigation: mainContainer.secondTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let secondTabDeeplinkHandlersFactory = SecondTabDeeplinkHandlersFactory(navigationManager: navigationManager, tabBarManager: tabBarManager)
		return secondTabDeeplinkHandlersFactory.produce()
	}
	
}
