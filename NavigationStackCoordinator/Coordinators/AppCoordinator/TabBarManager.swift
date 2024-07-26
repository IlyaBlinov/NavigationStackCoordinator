//
//  TabBarManager.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 02.07.2024.
//

import SwiftUI

final class TabBarNavigaton: ObservableObject {
	@Published var selectedTabIndex: Int = 0
}


final class TabBarManager {
	
	private let tabBarNavigaton: TabBarNavigaton
	
	init(tabBarNavigaton: TabBarNavigaton) {
		self.tabBarNavigaton = tabBarNavigaton
	}
	
	func setSelectedIndex(_ index: Int) {
		self.tabBarNavigaton.selectedTabIndex = index
	}
}
