//
//  NavigationManager.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 21.07.2024.
//

import SwiftUI
import NavigationStackBackport

final class Navigation: ObservableObject {
	@Published var path: NavigationStackBackport.NavigationPath = NavigationStackBackport.NavigationPath()
	@Published var sheet: AnyHashable?
	@Published var fullScreenCover: AnyHashable?
}

protocol INavigationManager: AnyObject {
	func push<T: Hashable>(_ value: T)
	func showSheet(_ sheet: AnyHashable)
	func hideSheet()
	func showFullScreenCover(_ fullScreenCover: AnyHashable)
	func hideFullScreenCover()
}

final class NavigationManager: INavigationManager  {
	
	private let navigation: Navigation
	
	init(navigation: Navigation) {
		self.navigation = navigation
	}
	
	
	func push<T: Hashable>(_ value: T) {
		self.navigation.path.append(value)
	}
	
	func showSheet(_ sheet: AnyHashable) {
		self.navigation.sheet = sheet
	}
	
	func hideSheet() {
		self.navigation.sheet = nil
	}
	
	func showFullScreenCover(_ fullScreenCover: AnyHashable) {
		self.navigation.fullScreenCover = fullScreenCover
	}
	
	func hideFullScreenCover() {
		self.navigation.fullScreenCover = nil
	}
	
	
	
	
}



//final class NavigationManager: ObservableObject {
//	
//	@Published var path: NavigationPath = NavigationPath()
//	@Published var sheet: AnyHashable?
//	@Published var fullScreenCover: AnyHashable?
//	
//	
//	func push<T: Hashable>(_ value: T) {
//		path.append(value)
//	}
//	
//	func showSheet(_ sheet: AnyHashable) {
//		self.sheet = sheet
//	}
//	
//	func hideSheet() {
//		self.sheet = nil
//	}
//	
//	func showFullScreenCover(_ fullScreenCover: AnyHashable) {
//		self.fullScreenCover = fullScreenCover
//	}
//	
//	func hideFullScreenCover() {
//		self.fullScreenCover = nil
//	}
//	
//	
//
//	
//}
