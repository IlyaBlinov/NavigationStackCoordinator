//
//  SecondTabViewIntDeeplinkMapperMock.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 17.08.2024.
//

import Foundation
@testable import NavigationStackCoordinator

// "deeplink://view_int?id:123456/tab:1/Hello_View_Int"
final class SecondTabViewIntDeeplinkMapperMock: IDeeplinkMapper {
	func run(_ url: URL) -> Deeplink {
		Deeplink.viewInt(tabBarIndex: 1)
	}
	
	func canOpenURL(_ url: URL) -> Bool {
		return url.absoluteString.contains("123456") && url.absoluteString.contains("tab:1")
	}
	
}
