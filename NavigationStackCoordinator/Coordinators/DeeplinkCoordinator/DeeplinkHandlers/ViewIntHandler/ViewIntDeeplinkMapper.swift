//
//  ViewIntDeeplinkMapper.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 13.08.2024.
//

import Foundation

// "deeplink://view_int?id:123456/tab:0/Hello_View_Int"
final class FirstTabViewIntDeeplinkMapper: IDeeplinkMapper {
	func run(_ url: URL) -> Deeplink {
		Deeplink.viewInt(tabBarIndex: 0)
	}
	
	func canOpenURL(_ url: URL) -> Bool {
		return url.absoluteString.contains("123456") && url.absoluteString.contains("tab:0")
	}
	
}

// "deeplink://view_int?id:123456/tab:1/Hello_View_Int"
final class SecondTabViewIntDeeplinkMapper: IDeeplinkMapper {
	func run(_ url: URL) -> Deeplink {
		Deeplink.viewInt(tabBarIndex: 1)
	}
	
	func canOpenURL(_ url: URL) -> Bool {
		return url.absoluteString.contains("123456") && url.absoluteString.contains("tab:1")
	}
	
}
