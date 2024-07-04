//
//  FirstTabCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import SwiftUI

protocol IFirstTabCoordinator {}

final class FirstTabCoordinator: IFirstTabCoordinator {
	
	private let pathManager: PathManager
	private let assembly: IFirstTabCoordinatorAssembly
	
	
	init(
		pathManager: PathManager,
		assembly: IFirstTabCoordinatorAssembly
	) {
		self.pathManager = pathManager
		self.assembly = assembly
		
	}
	
	@ViewBuilder
	private func rootView() -> some View {
		assembly.assemblyFirstTabView(model: .init(value: "I'm FirstTab"))
	}
	
	@ViewBuilder
	func view() -> some View {
		FirstTabCoordinatorView(
			coordinator: self,
			pathManager: pathManager,
			rootView: self.rootView()
		)
	}
	
	
}
