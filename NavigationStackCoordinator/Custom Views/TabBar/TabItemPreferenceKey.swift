//
//  TabItemPreferenceKey.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import SwiftUI


struct TabItemPreferenceKey: PreferenceKey {
	
	static var defaultValue: [TabItem] = []
	
	static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
		value += nextValue()
	}
	
}


extension View {
	func customTabItem<V>(@ViewBuilder _ label: () -> V) -> some View where V : View {
		modifier(TabItemModifier(tabBarItem: TabItem(view: AnyView(label()))))
	}
}

struct TabItemModifier: ViewModifier {
	let tabBarItem: TabItem
	
	func body(content: Content) -> some View {
		ZStack {
			content
				.preference(key: TabItemPreferenceKey.self, value: [tabBarItem])
		}
	}
}
