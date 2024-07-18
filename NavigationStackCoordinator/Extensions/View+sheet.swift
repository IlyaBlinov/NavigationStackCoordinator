//
//  View+sheet.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 08.07.2024.
//

import SwiftUI


extension View {
	func sheet<Content, T>(
		item: Binding<AnyHashable?>,
		type: T.Type,
		onDismiss: (() -> Void)? = nil,
		@ViewBuilder content: @escaping (T) -> Content
	) -> some View where Content : View, T: Hashable, T: Identifiable {
		let newBinding = item.convertAnyHashableToType(type: T.self)
		return self.sheet(item: newBinding, onDismiss: onDismiss, content: content)
	}
	
	func sheet<Content, T>(
		item: Binding<AnyHashable?>,
		type: T.Type,
		onDismiss: @escaping (T?) -> Void,
		@ViewBuilder content: @escaping (T) -> Content
	) -> some View where Content : View, T: Hashable, T: Identifiable {
		let newBinding = item.convertAnyHashableToType(type: T.self)
		let model = newBinding.wrappedValue
		return self.sheet(
			item: newBinding,
			onDismiss: { onDismiss(model) },
			content: content
		)
	}
}
