//
//  NavigationStackCoordinatorApp.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import SwiftUI

@main
struct NavigationStackCoordinatorApp: App {
	
	@StateObject private var appCoordinator: AppCoordinator
	private var deeplinkCoordinator: DeeplinkCoordinator
	
	init() {
		let mainContainer = MainContainer()
		self._appCoordinator = StateObject(wrappedValue: AppCoordinator(mainContainer: mainContainer))
		self.deeplinkCoordinator = mainContainer.makeDeeplinkCoordinator()
		
	}
	
	var body: some Scene {
		WindowGroup {
			appCoordinator.view()
				.onOpenURL(perform: { url in
					deeplinkCoordinator.handleURL(url)
			})
		}
	}
}

