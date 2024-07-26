//
//  AppCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 23.07.2024.
//

import SwiftUI

protocol IAppCoordinatorAssembly: AnyObject {
	func assemblyDeeplinkCoordinator() -> DeeplinkCoordinator
	func assemblyFirstTabCoordinator() -> FirstTabCoordinator
	
	func assemblyMainView() -> MainView<FirstTabNavigationView<FirstTabView>, Color, Color>
}

final class AppCoordinatorAssembly: IAppCoordinatorAssembly {
	
	
	weak var coordinator: AppCoordinator!
	
	private let mainContainer: MainContainer
	
	
	init(mainContainer: MainContainer) {
		self.mainContainer = mainContainer
	}
	
	func assemblyDeeplinkCoordinator() -> DeeplinkCoordinator {
		
		let deeplinkCoordinator = DeeplinkCoordinator()
		let navigationManager = NavigationManager(navigation: mainContainer.firstTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		
		let assembly = FirstTabCoordinatorAssembly(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager
		)
		
		let firstFlowDeeplinkHandlersFactory = FirstFlowDeeplinkHandlersFactory(coordinator: assembly.assemblyFirstFlowCoordinator())
		let firstTabDeeplinkHandlersFactory = FirstTabDeeplinkHandlersFactory(firstFlowDeeplinkHandlersFactory: firstFlowDeeplinkHandlersFactory)
		
		let firstTabDeeplinksHandlers = firstTabDeeplinkHandlersFactory.produce()
		
		deeplinkCoordinator.handlers.append(contentsOf: firstTabDeeplinksHandlers)
		
		return deeplinkCoordinator
		
	}
	
	// MARK: TabCoordinatorAssembly
	
	func assemblyFirstTabCoordinator() -> FirstTabCoordinator {
		let navigationManager = NavigationManager(navigation: mainContainer.firstTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let assembly = FirstTabCoordinatorAssembly(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager
		)
		let coordinator = FirstTabCoordinator(
			navigationManager: navigationManager,
			assembly: assembly
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	func assemblyMainView() -> MainView<FirstTabNavigationView<FirstTabView>, Color, Color> {
		MainView(
			tabBarNavigation: mainContainer.tabBarNavigaton,
			firstTabView: self.assemblyFirstTabCoordinatorView(),
			secondTabView: Color.green,
			thirdTabView: Color.blue
		)
	}
	
	
	func assemblyFirstTabCoordinatorView() -> FirstTabNavigationView<FirstTabView> {
		let coordinator = self.assemblyFirstTabCoordinator()
		return FirstTabNavigationView(
			navigation: mainContainer.firstTabNavigation,
			rootView: coordinator.view() as! FirstTabView
		)
		
	}
	
}
