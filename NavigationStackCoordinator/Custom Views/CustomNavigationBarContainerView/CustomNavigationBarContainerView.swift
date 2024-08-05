//
//  CustomNavigationBarContainerView.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 04.06.2024.
//

import Foundation
import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
	
	@State private var title: String = ""
	@State private var subtitle: String? = nil
	@State private var backButtonHidden: Bool = false
	
	
	let content: Content
	
	init(
		@ViewBuilder content: () -> Content
	) {
		self.content = content()
	}
	
	var body: some View {
		//let _ = Self._printChanges()
		VStack(spacing: 0) {
			CustomNavigationBarView(
				title: title,
				subtitle: subtitle,
				backButtonHidden: backButtonHidden,
				backButtonAction: {
					
				}
			)
			content
				.navigationBarHidden(true)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.onPreferenceChange(CustomNavigationBarTitlePreferenceKey.self, perform: { newTitle in
					self.title = newTitle
				})
				.onPreferenceChange(CustomNavigationBarSubTitlePreferenceKey.self, perform: { newSubTitle in
					self.subtitle = newSubTitle
				})
				.onPreferenceChange(CustomNavigationBarBackButtonHiddenPreferenceKey.self, perform: { hidden in
					backButtonHidden = hidden
				})
		}
		
	}
}

#Preview {
	CustomNavigationBarContainerView() {
		ZStack {
			Color.blue.ignoresSafeArea()
			Text("Hello")
				.foregroundColor(.white)
		}
	}
}
