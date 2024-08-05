//
//  FirstTabCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import SwiftUI

protocol IFirstTabCoordinator: AnyObject {
	func showViewInt()
}

final class FirstTabCoordinator: IFirstTabCoordinator {
	
	private let navigationManager: INavigationManager
	private let assembly: IFirstTabCoordinatorAssembly
	
	
	init(
		navigationManager: INavigationManager,
		assembly: IFirstTabCoordinatorAssembly
	) {
		self.navigationManager = navigationManager
		self.assembly = assembly
		
	}
	
	@ViewBuilder
	func view() -> some View {
		assembly.assemblyFirstTabView(model: .init(value: "I'm FirstTab"))
	}
	
	func showViewInt() {
		let firstFlowCoordinator = assembly.assemblyFirstFlowCoordinator()
		self.navigationManager.push(firstFlowCoordinator)
	}
	
	
}
