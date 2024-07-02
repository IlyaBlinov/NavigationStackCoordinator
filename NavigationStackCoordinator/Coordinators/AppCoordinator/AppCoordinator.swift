//
//  AppCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import SwiftUI




final class MainContainer {
	
	func makeFirstTabAssembly(pathManager: PathManager) -> FirstTabAssembly {
		FirstTabAssembly()
	}
}

final class AppCoordinator {
	
	
	private let mainContainer: MainContainer
	
	init( mainContainer: MainContainer) {
		self.mainContainer = mainContainer
	}
	
	
	@ViewBuilder
	func view() -> some View {
		MainView(
			appCoordinator: self,
			firstTabView: self.makeFirstTabCoordinatorView(),
			secondTabView: Color.green,
			thirdTabView: Color.blue
		)
	}
	
	@ViewBuilder
	private func makeFirstTabCoordinatorView() -> some View {
		let pathManager = PathManager()
		let assembly = FirstTabAssembly()
		let coordinator = FirstTabCoordinator(pathManager: pathManager, assembly: assembly)
		FirstTabCoordinatorView(
			coordinator: coordinator,
			pathManager: pathManager
		)
	}
	
	
}


struct FirstTabCoordinatorView: View {
	
	@StateObject private var  pathManager: PathManager
	
	private let coordinator: FirstTabCoordinator
	
	
	init(
		coordinator: FirstTabCoordinator,
		pathManager: PathManager
	) {
		self.coordinator = coordinator
		self._pathManager = StateObject(wrappedValue: pathManager)
		
	}
	
	var body: some View {
		let _ = Self._printChanges()
		NavigationStack(path: $pathManager.path) {
			coordinator.view()
				.navigationDestination(for: FirstFlowCoordinator.self) { coordinator in
					coordinator.view()
				}
		}
	}
	
	
	
}


protocol IFirstTabCoordinator {}


final class FirstTabCoordinator: IFirstTabCoordinator {
	
	private let pathManager: PathManager
	private let assembly: IFirstTabAssembly
	
	
	init(
		pathManager: PathManager,
		assembly: IFirstTabAssembly
	) {
		self.pathManager = pathManager
		self.assembly = assembly
	}
	
	@ViewBuilder
	func view() -> some View {
			Group {
				assembly.assembly(model: .init(value: "I'm FirstTabView"),output: <#T##any IFirstTabViewOutput#> )
			}
		
		
	}
	
	
}
