//
//  SecondFlowCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import Foundation
import SwiftUI

enum SecondFlowPage {
	case viewInt, viewString, viewDouble
}

final class SecondFlowCoordinator: Hashable {
	
	private let pathManager: PathManager
	
	private var id: UUID
	private var output: Output?
	private var page: SecondFlowPage
	
	struct Output {
		var goToNextCoordinator: () -> Void
	}
	
	init(
		page: SecondFlowPage,
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
		case .viewDouble:
			ViewDouble().configure(.init(value: 999.0), output: ViewDoubleOutput(pathManager: pathManager))
		case .viewString:
			ViewString().configure(.init(value: "Second Flow"), output: ViewStringOutput(pathManager: pathManager))
		}
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: SecondFlowCoordinator,
		rhs: SecondFlowCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
	
	func push<V>(_ value: V) where V : Hashable {
		pathManager.push(value)
	}
}

extension SecondFlowCoordinator {
	final class ViewIntOutput: IViewIntOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(SecondFlowCoordinator(page: .viewDouble, pathManager: pathManager))
		}
		
		
	}
	
	
	final class ViewDoubleOutput: IViewDoubleOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(SecondFlowCoordinator(page: .viewString, pathManager: pathManager))
		}
		
		
	}
	
	
	final class ViewStringOutput: IViewStringOutput {
		
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(SecondFlowCoordinator(page: .viewInt, pathManager: pathManager))
		}
		
		
	}
	
	
	final class FirstTabOutput: IFirstTabViewOutput {
		let pathManager: PathManager
		
		init(pathManager: PathManager) {
			self.pathManager = pathManager
		}
		
		func pushNextScreen() {
			pathManager.push(SecondFlowCoordinator(page: .viewInt, pathManager: pathManager))
		}
	}
}
