//
//  AppCoordinatorAssembly.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 23.07.2024.
//

import SwiftUI

protocol IAppCoordinatorAssembly: AnyObject {
	func assemblyDeeplinkCoordinator() -> DeeplinkCoordinator
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
	
	private func assemblyFirstTabCoordinator() -> FirstTabCoordinator {
		let navigationManager = NavigationManager(navigation: mainContainer.firstTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let assembly = FirstTabCoordinatorAssembly()
		let coordinator = FirstTabCoordinator(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager,
			assembly: assembly
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	private func assemblySecondTabCoordinator() -> SecondTabCoordinator {
		let navigationManager = NavigationManager(navigation: mainContainer.secondTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let assembly = SecondTabCoordinatorAssembly()
		let coordinator = SecondTabCoordinator(
			navigationManager: navigationManager,
			tabBarManager: tabBarManager,
			assembly: assembly
		)
		assembly.coordinator = coordinator
		return coordinator
	}
	
	
	private func assemblyThirdTabCoordinator() -> ThirdTabCoordinator {
		let navigationManager = NavigationManager(navigation: mainContainer.secondTabNavigation)
		let tabBarManager = TabBarManager(tabBarNavigaton: mainContainer.tabBarNavigaton)
		let assembly = ThirdTabCoordinatorAssembly()
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
	
	
	private func assemblyFirstTabCoordinatorView() -> FirstTabNavigationView<FirstTabView> {
		
		let coordinator = self.assemblyFirstTabCoordinator()
		
		let output = FirstTabOutput(coordinator: coordinator)
		let rootView = FirstTabViewAssembly().assembly(model: .init(value: "I'm FirstTab"), output: output)
		
		return FirstTabNavigationView(navigation: mainContainer.firstTabNavigation, rootView: rootView)
	}
	

	
	private func assemblySecondTabCoordinatorView() -> SecondTabNavigationView<SecondTabView> {
		let coordinator = self.assemblySecondTabCoordinator()
		
		let output = SecondTabOutput(coordinator: coordinator)
		let rootView = SecondTabViewAssembly().assembly(model: .init(value: "I'm SecondTab"), output: output)
		
		return SecondTabNavigationView(
			navigation: mainContainer.secondTabNavigation,
			rootView: rootView
		)
		
	}
	
	private func assemblyThirdTabCoordinatorView() -> ThirdTabNavigationView<ThirdTabView> {
		let coordinator = self.assemblyThirdTabCoordinator()
		
		let output = ThirdTabOutput(coordinator: coordinator)
		let rootView = ThirdTabViewAssembly().assembly(model: .init(value: "I'm ThirdTab"), output: output)
		
		return ThirdTabNavigationView(
			navigation: mainContainer.thirdTabNavigation,
			rootView: rootView
		)
		
	}
	
}
