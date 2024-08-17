//
//  Deeplink.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 13.08.2024.
//

import Foundation

struct Deeplink {
	let id: String
	let name: String
	var parameters: [String: Any?]
}


extension Deeplink {
	enum ParameterKey: String, Hashable {
		case tabBarIndex
	}
}
