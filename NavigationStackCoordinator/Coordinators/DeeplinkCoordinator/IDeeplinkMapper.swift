//
//  IDeeplinkMapper.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 15.08.2024.
//

import Foundation

protocol IDeeplinkMapper {
	func run(_ url: URL) -> Deeplink
	func canOpenURL(_ url: URL) -> Bool
}
