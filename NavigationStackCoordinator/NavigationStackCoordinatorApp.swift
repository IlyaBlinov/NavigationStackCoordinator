//
//  NavigationStackCoordinatorApp.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import SwiftUI

@main
struct NavigationStackCoordinatorApp: App {
	
	var appCoordinator: AppCoordinator
	private var deeplinkCoordinator: DeeplinkCoordinator
	
	init() {
		let mainContainer = MainContainer()
		let assembly = AppCoordinatorAssembly(mainContainer: mainContainer)
		self.appCoordinator = AppCoordinator(assembly: assembly)
		assembly.coordinator = self.appCoordinator
		self.deeplinkCoordinator = assembly.assemblyDeeplinkCoordinator()
		
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

