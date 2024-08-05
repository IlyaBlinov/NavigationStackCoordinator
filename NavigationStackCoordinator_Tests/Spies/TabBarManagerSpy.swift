//
//  TabBarManagerSpy.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 04.08.2024.
//

import Foundation
@testable import NavigationStackCoordinator

final class TabBarManagerSpy: ITabBarManager {
	
	var callSetSelectedIndex: Bool = false
	var selectedIndex: Int?
	
	func setSelectedIndex(_ index: Int) {
		callSetSelectedIndex = true
		selectedIndex = index
	}
	
	
}
