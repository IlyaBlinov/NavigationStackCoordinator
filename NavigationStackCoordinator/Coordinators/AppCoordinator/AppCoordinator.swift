//
//  AppCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import SwiftUI

final class AppCoordinator: Hashable {
	
	private let assembly: IAppCoordinatorAssembly
	private let id: UUID
	
	init(assembly: IAppCoordinatorAssembly) {
		self.assembly = assembly
		self.id = UUID()
	}
	
	
	@ViewBuilder
	func view() -> some View {
		assembly.assemblyMainView()
	}
	
	static func == (lhs: AppCoordinator, rhs: AppCoordinator) -> Bool {
		lhs.id == rhs.id
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
}

