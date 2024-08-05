//
//  FirstFlowFullScreenCoverCoordinator.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 19.07.2024.
//

import SwiftUI

protocol IFirstFlowFullScreenCoverCoordinator: AnyObject {
	
	func showLoader()
	
}

final class FirstFlowFullScreenCoverCoordinator: Hashable, Identifiable, IFirstFlowFullScreenCoverCoordinator {
	
	enum FullScreenCover {
		case loader
	}
	
	private let assembly: IFirstFlowFullScreenCoverAssembly
	var fullScreenCover: FullScreenCover
	
	let id: UUID
	
	init(
		fullScreenCover: FullScreenCover,
		assembly: IFirstFlowFullScreenCoverAssembly
	) {
		self.id = UUID()
		self.fullScreenCover = fullScreenCover
		self.assembly = assembly
	}
	
	@ViewBuilder
	func view() -> some View {
		switch self.fullScreenCover {
		case .loader:
			assembly.assemblyLoader(.init())
		}
	}
	
	
	func showLoader() {
		self.fullScreenCover = .loader
	}
	
	// MARK: Hashable
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
	static func == (
		lhs: FirstFlowFullScreenCoverCoordinator,
		rhs: FirstFlowFullScreenCoverCoordinator
	) -> Bool {
		lhs.id == rhs.id
	}
}
