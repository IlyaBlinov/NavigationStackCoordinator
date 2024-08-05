//
//  FirstTabCoordinatorView.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 30.06.2024.
//

import Foundation
import SwiftUI
import NavigationStackBackport

struct FirstTabNavigationView<R: View>: View {
	
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
		//let _ = Self._printChanges()
		NavigationStackBackport.NavigationStack(path: $navigation.path) {
			rootView
				.backport.navigationDestination(for: FirstFlowCoordinator.self) { coordinator in
					coordinator.view()
				}
				.backport.navigationDestination(for: SecondFlowCoordinator.self) { coordinator in
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

