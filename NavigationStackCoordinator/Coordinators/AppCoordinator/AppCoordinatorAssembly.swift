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
	
	func assemblyMainView() -> MainView<FirstTabNavigationView<FirstTabView>, SecondTabNavigationView<SecondTabView>, ThirdTabNavigationView<ThirdTabView>>
}

final class AppCoordinatorAssembly: IAppCoordinatorAssembly {
	
	
	weak var coordinator: AppCoordinator!
	
	private let mainContainer: MainContainer
	
	
	init(mainContainer: MainContainer) {
		self.mainContainer = mainContainer
	}
	
	func assemblyDeeplinkCoordinator() -> DeeplinkCoordinator {
		
		let deeplinkCoordinatorAssembly = DeeplinkCoordinatorAssembly(mainContainer: mainContainer)
		let deeplinkCoordinator = DeeplinkCoordinator(assembly: deeplinkCoordinatorAssembly)
		
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
			tabBarManager: tabBarManager,
			assembly: assembly
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	func assemblySecondTabCoordinator() -> SecondTabCoordinator {
		let navigationManager = NavigationManager(navigation: mainContainer.secondTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let assembly = SecondTabCoordinatorAssembly(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager
		)
		let coordinator = SecondTabCoordinator(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager,
			assembly: assembly
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	
	func assemblyThirdTabCoordinator() -> ThirdTabCoordinator {
		let navigationManager = NavigationManager(navigation: mainContainer.secondTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let assembly = ThirdTabCoordinatorAssembly(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager
		)
		let coordinator = ThirdTabCoordinator(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager,
			assembly: assembly
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	func assemblyMainView() -> MainView<FirstTabNavigationView<FirstTabView>, SecondTabNavigationView<SecondTabView>, ThirdTabNavigationView<ThirdTabView>> {
		MainView(
			tabBarNavigation: mainContainer.tabBarNavigaton,
			firstTabView: self.assemblyFirstTabCoordinatorView(),
			secondTabView: self.assemblySecondTabCoordinatorView(),
			thirdTabView: self.assemblyThirdTabCoordinatorView()
		)
	}
	
	
	func assemblyFirstTabCoordinatorView() -> FirstTabNavigationView<FirstTabView> {
		let coordinator = self.assemblyFirstTabCoordinator()
		return FirstTabNavigationView(
			navigation: mainContainer.firstTabNavigation,
			rootView: coordinator.view() as! FirstTabView
		)
		
	}
	
	func assemblySecondTabCoordinatorView() -> SecondTabNavigationView<SecondTabView> {
		let coordinator = self.assemblySecondTabCoordinator()
		return SecondTabNavigationView(
			navigation: mainContainer.secondTabNavigation,
			rootView: coordinator.view() as! SecondTabView
		)
		
	}
	
	func assemblyThirdTabCoordinatorView() -> ThirdTabNavigationView<ThirdTabView> {
		let coordinator = self.assemblyThirdTabCoordinator()
		return ThirdTabNavigationView(
			navigation: mainContainer.thirdTabNavigation,
			rootView: coordinator.view() as! ThirdTabView
		)
		
	}
	
}
