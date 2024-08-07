//
//  SecondTabNavigationView.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 06.08.2024.
//

import Foundation
import SwiftUI


struct SecondTabNavigationView<R: View>: View {
	
	@StateObject private var navigation: Navigation
	
	@State private var sheet: AnyHashable?
	@State private var fullScreenCover: AnyHashable?
	
	
	private let rootView: R
	
	init(
		navigation: Navigation,
		rootView: R
	) {
		self._navigation = StateObject(wrappedValue: navigation)
		self.rootView = rootView
		
	}
	
	var body: some View {
		let _ = Self._printChanges()
		NavigationStack(path: $navigation.path) {
			rootView
				.navigationDestination(for: FirstFlowCoordinator.self) { coordinator in
					coordinator.view()
				}
				.navigationDestination(for: SecondFlowCoordinator.self) { coordinator in
					coordinator.view()
				}
				.navigationDestination(for: ThirdFlowCoordinator.self) { coordinator in
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
		.fullScreenCover(
			item: $fullScreenCover,
			type: FirstFlowFullScreenCoverCoordinator.self,
			content: { coordinator in
				coordinator.view()
			})
		.onReceive(navigation.$sheet, perform: { sheet in
			self.sheet = sheet
		})
		.onReceive(navigation.$fullScreenCover, perform: { fullScreenCover in
			self.fullScreenCover = fullScreenCover
		})
	}
	
}

