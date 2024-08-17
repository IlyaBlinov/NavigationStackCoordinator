//
//  ViewIntDeeplinkMapperDummy.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 17.08.2024.
//

import Foundation
@testable import NavigationStackCoordinator

final class ViewIntDeeplinkMapperDummy: IDeeplinkMapper {
	func run(_ url: URL) -> Deeplink {
		.init(id: "", name: "", parameters: [:])
	}
	
	func canOpenURL(_ url: URL) -> Bool {
		true
	}
	
	
}
