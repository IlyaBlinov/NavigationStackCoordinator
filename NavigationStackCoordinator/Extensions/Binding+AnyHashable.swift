//
//  Binding+AnyHashable.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import SwiftUI

extension Binding where Value == AnyHashable? {
	func convertAnyHashableToType<T>(type: T.Type) -> Binding<T?> where T: Hashable {
		.init {
			self.wrappedValue?.base as? T
		} set: { newValue in
			self.wrappedValue = AnyHashable(newValue)
		}
	}
}
