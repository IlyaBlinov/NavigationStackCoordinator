//
//  FirstFlowCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import Foundation
import SwiftUI

enum FirstFlowPage {
	case viewInt, viewString, viewDouble
}



final class FirstFlowCoordinator: Hashable {
	
	private let pathManager: PathManager
	
	private var id: UUID
	private var output: Output?
	private var page: FirstFlowPage
	
	struct Output {
		var goToNextCoordinator: () -> Void
	}
	
	init(
		page: FirstFlowPage,
		pathManager: PathManager,
		output: Output? = nil
	) {
		id = UUID()
		self.page = page
		self.output = output
		self.pathManager = pathManager
	}
	
	@ViewBuilder
	func view() -> some View {
		switch self.page {
		case .viewInt:
			ViewInt().configure(.init(value: 100), output: ViewIntOutput(pathManager: pathManager))
				.navigationDestination(for: SecondFlowCoordinator.self) { coordinator in
					coordinator.view()
				}
		case .viewDouble:
			ViewDouble().configure(.init(value: 999.0), output: ViewDoubleOutput(pathManager: pathManager))
		case .viewString:
			ViewString().configure(.init(value: "FirstFlow"), output: ViewStringOutput(pathManager: pathManager))
				.navigationDestination(for: ThirdFlowCoordinator.self) { [pathManager] coordinator in
					coordinator.view(pathManager: pathManager)
				}
				
		}
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: FirstFlowCoordinator,
		rhs: FirstFlowCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
	
	func push<V>(_ value: V) where V : Hashable {
		pathManager.push(value)
	}
}


	
	
	
	

	
	
	final class FirstTabOutput: IFirstTabViewOutput {
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(FirstFlowCoordinator(page: .viewInt, pathManager: pathManager))
		}
	}

