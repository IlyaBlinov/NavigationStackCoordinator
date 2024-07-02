//
//  FirstTabCoordinatorView.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import Foundation
import SwiftUI

struct FirstTabCoordinatorView<R: View>: View {
	
	@StateObject private var  pathManager: PathManager
	
	private let coordinator: FirstTabCoordinator
	
	private let rootView: R
	
	init(
		coordinator: FirstTabCoordinator,
		pathManager: PathManager,
		rootView: R
	) {
		self.coordinator = coordinator
		self._pathManager = StateObject(wrappedValue: pathManager)
		self.rootView = rootView
		
	}
	
	var body: some View {
		let _ = Self._printChanges()
		NavigationStack(path: $pathManager.path) {
			rootView
				.navigationDestination(for: FirstFlowCoordinator.self) { coordinator in
					coordinator.view()
				}
				.navigationDestination(for: SecondFlowCoordinator.self) { coordinator in
					coordinator.view()
				}
		}
	}
	
}
