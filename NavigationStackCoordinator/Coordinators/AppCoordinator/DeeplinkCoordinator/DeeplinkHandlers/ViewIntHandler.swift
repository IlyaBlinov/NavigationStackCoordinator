//
//  ViewIntHandler.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

final class ViewIntHandler: IDeeplinkHandler {
	
	private var coordinator: FirstFlowCoordinator
	
	
	init(coordinator: FirstFlowCoordinator) {
		self.coordinator = coordinator
	}
	
	// MARK: - DeeplinkHandlerProtocol
	
	func canOpenURL(_ url: URL) -> Bool {
		return url.absoluteString == "deeplink://tab_1/view_int/Hello_View_Int"
	}
	
	func openURL(_ url: URL) {
		guard canOpenURL(url) else {
			return
		}
		coordinator.selectNewTab(index: 0)
		coordinator.showViewInt()
		
	}
	
	
}
