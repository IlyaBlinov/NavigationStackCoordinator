//
//  NavigationManagerSpy.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 04.08.2024.
//

import Foundation
@testable import NavigationStackCoordinator


final class NavigationManagerSpy: INavigationManager {
	
	var callPush: Bool = false
	var callShowSheet: Bool = false
	var callShowFullScreenCover: Bool = false
	var callHideSheet: Bool = false
	var callHideFullScreenCover: Bool = false
	
	var pushedValue: AnyHashable?
	var showedSheet:  AnyHashable?
	var showedFullScreenCover: AnyHashable?
	

	func push<T>(_ value: T) where T : Hashable {
		callPush = true
		pushedValue = AnyHashable(value)
	}
	
	func showSheet(_ sheet: AnyHashable) {
		callShowSheet = true
		showedSheet = sheet
	}
	
	func hideSheet() {
		callHideSheet = true
		showedSheet = nil
	}
	
	func showFullScreenCover(_ fullScreenCover: AnyHashable) {
		callShowFullScreenCover = true
		showedFullScreenCover = fullScreenCover
	}
	
	func hideFullScreenCover() {
		callHideFullScreenCover = true
		showedFullScreenCover = nil
	}
	
	
}
