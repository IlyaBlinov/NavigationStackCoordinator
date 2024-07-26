//
//  ViewDoubleHandler.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

final class ViewDoubleHandler: IDeeplinkHandler {
	
	private var coordinator: IFirstFlowCoordinator
	
	
	init(coordinator: IFirstFlowCoordinator) {
		self.coordinator = coordinator
	}
	
	// MARK: - DeeplinkHandlerProtocol
	
	func canOpenURL(_ url: URL) -> Bool {
		return url.absoluteString == "deeplink://tab_1/view_double/Hello_View_Double"
	}
	
	func openURL(_ url: URL) {
		guard canOpenURL(url) else {
			return
		}
		coordinator.selectNewTab(index: 0)
		coordinator.showViewInt()
		
	}
	
	
}
