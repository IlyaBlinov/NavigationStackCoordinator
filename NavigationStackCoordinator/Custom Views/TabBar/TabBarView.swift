//
//  TabBarView.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import SwiftUI

struct TabBarView<Content: View>: View {
	
	
	private var content: Content
	@State private var tabs: [TabItem] = []
	
	@Binding private var selection: Int
	
	init(selection: Binding<Int>, @ViewBuilder content: () -> Content) {
		_selection = selection
		self.content = content()
	}
	
	var body: some View {
		//let _ = Self._printChanges()
		ZStack(alignment: .bottom) {
			content
			HStack(spacing: -1) {
				tabsView
					.padding(.bottom, 10)
					.background(Color.black)
			}
			.frame(maxWidth: .infinity)
			.frame(height: 120)
			
			
		}.ignoresSafeArea()
			.onPreferenceChange(TabItemPreferenceKey.self) { value in
				tabs = value
			}
	}
	
	private var tabsView: some View {
		ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
			TabBarItemView(content: {
				tab.view
			},
										 selection: selection == index
			)
			.onTapGesture {
				selection = index
			}
		}
	}
	
}
