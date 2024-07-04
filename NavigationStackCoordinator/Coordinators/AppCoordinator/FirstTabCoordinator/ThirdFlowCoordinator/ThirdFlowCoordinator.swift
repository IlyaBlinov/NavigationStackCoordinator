//
//  ThirdFlowCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import Foundation
import Foundation
import SwiftUI

enum ThirdFlowPage: Codable {
	case viewInt, viewString, viewDouble
}

final class ThirdFlowCoordinator: Hashable, Codable {
	
	private var id: UUID
	private var page: ThirdFlowPage
	
	
	init(
		page: ThirdFlowPage
	) {
		id = UUID()
		self.page = page
	}
	
	@ViewBuilder
	func view(pathManager: PathManager) -> some View {
		switch self.page {
		case .viewInt:
			ViewInt().configure(.init(value: 100, output: ViewIntOutput(pathManager: pathManager)))
		case .viewDouble:
			ViewDouble().configure(.init(value: 999.0), output: ViewDoubleOutput(pathManager: pathManager))
		case .viewString:
			ViewString().configure(.init(value: "THird Flow"), output: ViewStringOutput(pathManager: pathManager))
		}
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: ThirdFlowCoordinator,
		rhs: ThirdFlowCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
	
}

extension ThirdFlowCoordinator {
	final class ViewIntOutput: IViewIntOutput {
		func presentDoubleViewSheet() {
		}
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(ThirdFlowCoordinator(page: .viewDouble))
		}
		
		
	}
	
	
	final class ViewDoubleOutput: IViewDoubleOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(ThirdFlowCoordinator(page: .viewString))
		}
		
		
	}
	
	
	final class ViewStringOutput: IViewStringOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(ThirdFlowCoordinator(page: .viewInt))
		}
		
		
	}
	
	
	final class FirstTabOutput: IFirstTabViewOutput {
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(ThirdFlowCoordinator(page: .viewInt))
		}
	}
}
