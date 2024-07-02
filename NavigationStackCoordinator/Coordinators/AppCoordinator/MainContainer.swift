//
//  MainContainer.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import SwiftUI

final class MainContainer {
	
	var tabBarManager = TabBarManager()
	
	var firstTabPathManager = PathManager()
	
	var secondTabPathManager = PathManager()
	
	var thirdTabPathManager = PathManager()
	
	

	
	func makeDeeplinkCoordinator() -> DeeplinkCoordinator {
		let deeplinkCoordinator = DeeplinkCoordinator()
		let firstFlowCoordinator = self.makeFirstTabCoordinatorAssembly().assemblyFirstFlowCoordinator()
		
		let firstFlowDeeplinkHandlersFactory = FirstFlowDeeplinkHandlersFactory(mainContainer: self)
		let firstTabDeeplinkHandlersFactory = FirstTabDeeplinkHandlersFactory(firstFlowDeeplinkHandlersFactory: firstFlowDeeplinkHandlersFactory)
		
		let firstTabDeeplinksHandlers = firstTabDeeplinkHandlersFactory.produce()
		
		deeplinkCoordinator.handlers.append(contentsOf: firstTabDeeplinksHandlers)
		
		return deeplinkCoordinator
		
	}
	
	// MARK: TabCoordinatorAssembly
	func makeFirstTabCoordinatorAssembly() -> FirstTabCoordinatorAssembly {
		FirstTabCoordinatorAssembly(pathManager: firstTabPathManager, tabBarManager: tabBarManager)
	}
	

}






