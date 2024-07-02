//
//  AppCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import SwiftUI

final class TabBarManager: ObservableObject {
	@Published var selectedTabIndex: Int = 0
}


final class AppCoordinator: ObservableObject {
	
	private let mainContainer: MainContainer
	
	init(mainContainer: MainContainer) {
		self.mainContainer = mainContainer
	}
	
	
	@ViewBuilder
	func view() -> some View {
		MainView(
			tabBarManager: mainContainer.tabBarManager,
			firstTabView: self.makeFirstTabCoordinatorView(),
			secondTabView: Color.green,
			thirdTabView: Color.blue
		)
	}
	
	@ViewBuilder
	func makeFirstTabCoordinatorView() -> some View {
		let coordinator = FirstTabCoordinator(
			pathManager: mainContainer.firstTabPathManager,
			assembly: mainContainer.makeFirstTabCoordinatorAssembly()
		)
		coordinator.view()
	}
	
}

