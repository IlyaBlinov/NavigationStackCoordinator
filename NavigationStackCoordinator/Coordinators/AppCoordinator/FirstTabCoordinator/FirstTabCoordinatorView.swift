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
	
	@State private var sheet: AnyHashable?
	
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
		.sheet(
			item: $sheet,
			type: FirstFlowSheetCoordinator.self,
			content: { coordinator in
			coordinator.view()
		})
		.sheet(
			item: $sheet,
			type: SecondFlowSheetCoordinator.self,
			content: { coordinator in
				coordinator.view()
			})
		.onReceive(pathManager.$sheet, perform: { sheet in
			self.sheet = sheet
		})
		.fullScreenCover(item: $pathManager.fullScreenCover) { action in
			showFullScreenCoverView(action)
		}
	}
	
	@ViewBuilder
	private func showFullScreenCoverView(_ action: FullScreenCoverAction) -> some View {
		switch action {
		case .viewString(let viewString):
			viewString
		}
	}

	
}

