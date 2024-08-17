//
//  DeeplinkCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import Foundation

protocol IDeeplinkHandler {
	func canOpenURL(_ url: URL) -> Bool
	func openURL(_ url: URL)
}

protocol IDeeplinkCoordinator {
	var handlers: [IDeeplinkHandler] { get set }
	
	@discardableResult
	func handleURL(_ url: URL) -> Bool
}


final class DeeplinkCoordinator: IDeeplinkCoordinator {
	
	var handlers: [IDeeplinkHandler]
	
	private let assembly: IDeeplinkCoordinatorAssembly
	
	init(assembly: IDeeplinkCoordinatorAssembly) {
		self.assembly = assembly
		self.handlers = assembly.assemblyDeeplinkHandlers()
	}
	
	@discardableResult
	func handleURL(_ url: URL) -> Bool {
		handlers.forEach { $0.openURL(url) }
		return true
	}
	
	
}
