//
//  File.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import SwiftUI


//struct MainView: View {
//	
//	private let pathManager: PathManager
//	
//	init(pathManager: PathManager) {
//		self.pathManager = pathManager
//	}
//	
//	var body: some View {
//		let _ = Self._printChanges()
//		Group {
//			FirstTabView().configure(.init(value: "HI"), output: FirstFlowCoordinator.FirstTabOutput(pathManager: pathManager))
//		}
		
//	}
//}

class TabBarSettings: ObservableObject {
	
	@Published var selectedIndex: Int = 0
	
	init(selectedIndex: Int) {
		self.selectedIndex = selectedIndex
	}
	
}

struct MainView<FirstTabView: View, SecondTabView: View,  ThirdTabView: View>: View {
	
	@StateObject private var tabBarNavigation: TabBarNavigaton
	
	private let firstTabView: FirstTabView
	private let secondTabView: SecondTabView
	private let thirdTabView: ThirdTabView
	
	init(
		tabBarNavigation: TabBarNavigaton,
		firstTabView: FirstTabView,
		secondTabView: SecondTabView,
		thirdTabView: ThirdTabView
	) {
		self._tabBarNavigation = StateObject(wrappedValue: tabBarNavigation)
		self.firstTabView = firstTabView
		self.secondTabView = secondTabView
		self.thirdTabView = thirdTabView
	}
	
	var body: some View {
		//let _ = Self._printChanges()
		TabBarView(selection: $tabBarNavigation.selectedTabIndex) {
			firstTabView
				.customTabItem {
					Text("FirstTabFlow")
						.foregroundColor(.white)
				}
				.opacity(tabBarNavigation.selectedTabIndex == 0 ? 1 : 0)
			secondTabView
				.customTabItem {
					Text("SecondTabFlow")
						.foregroundColor(.white)
				}
				.opacity(tabBarNavigation.selectedTabIndex == 1 ? 1 : 0)
			
			thirdTabView
				.customTabItem {
					Text("ThirdTabFlow")
						.foregroundColor(.white)
				}
				.opacity(tabBarNavigation.selectedTabIndex == 2 ? 1 : 0)
			
			
		}
	}
}
