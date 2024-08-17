//
//  ViewIntHandler.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

extension Deeplink {
	static func viewInt(tabBarIndex: Int? = nil, payload: String? = nil) -> Deeplink {
		return Deeplink(
			id: "123456",
			name: "viewInt",
			parameters: [
				"tabBarIndex": tabBarIndex,
				"payload": payload
			]
		)
	}
}

final class ViewIntDeeplinkHandler: IDeeplinkHandler {
	
	private let tabBarManager: TabBarManager
	private let navigationManager: NavigationManager
	private let mapper: IDeeplinkMapper
	
	init(
		tabBarManager: TabBarManager,
		navigationManager: NavigationManager,
		mapper: IDeeplinkMapper
	) {
		self.tabBarManager = tabBarManager
		self.navigationManager = navigationManager
		self.mapper = mapper
	}
	
	// MARK: - DeeplinkHandlerProtocol
	
	func canOpenURL(_ url: URL) -> Bool {
		mapper.canOpenURL(url)
	}
	
	func openURL(_ url: URL) {
		guard canOpenURL(url) else {
			return
		}
		let deeplink = mapper.run(url)
		
		let asssembly = FirstFlowCoordinatorAssembly()
		let coordinator = FirstFlowCoordinator(page: .viewInt, navigationManager: navigationManager, assembly: asssembly, tabBarManager: tabBarManager)
		asssembly.coordinator = coordinator
		if let tabBarIndex = deeplink.parameters[Deeplink.ParameterKey.tabBarIndex.rawValue] as? Int {
			tabBarManager.setSelectedIndex(tabBarIndex)
		}
		navigationManager.push(coordinator)
	}
}

