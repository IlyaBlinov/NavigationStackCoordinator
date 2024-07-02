//
//  FirstFlowCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import Foundation
import SwiftUI



protocol IFirstFlowCoordinator{
	
	func showViewString()
	
	func showViewInt()
	
	func showViewDouble()
	
	func showSecondFlowCoordinatorView()
	
	func selectNewTab(index: Int)
}

final class FirstFlowCoordinator: Hashable, IFirstFlowCoordinator {
	
	enum Page: CaseIterable {
		case viewInt, viewString, viewDouble
	}
	
	private let pathManager: PathManager
	private let assembly: IFirstFlowCoordinatorAssembly
	
	private var id: UUID
	private var page: Page
	private var tabBarManager: TabBarManager
	
	init(
		page: Page,
		pathManager: PathManager,
		assembly: IFirstFlowCoordinatorAssembly,
		tabBarManager: TabBarManager
	) {
		id = UUID()
		self.page = page
		self.pathManager = pathManager
		self.assembly = assembly
		self.tabBarManager = tabBarManager
	}
	
	@ViewBuilder
	func view() -> some View {
		switch self.page {
		case .viewInt:
			assembly.assemblyViewInt(.init(value: 100), output: ViewIntOutput(coordinator: self))
		case .viewDouble:
			assembly.assemblyViewDouble(.init(value: 999.0), output: ViewDoubleOutput(coordinator: self))
		case .viewString:
			assembly.assemblyString(.init(value: "FirstFlow"), output: ViewStringOutput(coordinator: self))
				.navigationDestination(for: ThirdFlowCoordinator.self) { [pathManager] coordinator in
					coordinator.view(pathManager: pathManager)
				}
				
		}
	}
	
	func selectNewTab(index: Int) {
		self.tabBarManager.selectedTabIndex = index
	}
	
	//MARK:  Show Views
	
	func showViewString() {
		self.page = .viewString
		self.pathManager.push(self)
	}
	
	func showViewInt() {
		self.page = .viewInt
		self.pathManager.push(self)
	}
	
	func showViewDouble() {
		self.page = .viewDouble
		self.pathManager.push(self)
	}
	
	func showSecondFlowCoordinatorView() {
		let secondCoordinator = SecondFlowCoordinator(page: .viewString, pathManager: self.pathManager)
		self.pathManager.push(secondCoordinator)
	}
	
	// MARK: Hashable
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: FirstFlowCoordinator,
		rhs: FirstFlowCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
	
}

