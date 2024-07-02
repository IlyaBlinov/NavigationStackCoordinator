//
//  TabBarItemView.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 02.06.2024.
//

import Foundation
import SwiftUI

struct TabBarItemView<Content: View>: View {
	
	private var selection: Bool
	
	private var content: Content
	
	init(
		@ViewBuilder content: () -> Content,
		selection: Bool
	) {
		self.selection = selection
		self.content = content()
	}
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 7.056)
				.inset(by: 1)
				.stroke(.green)
				.background(
					selection ? .green.opacity(0.5) : Color.clear
				)
				.cornerRadius(7.056)
			
			content
			
		}
		.contentShape(Rectangle())
	}
}




struct TabBarItemView_Previews: PreviewProvider {
	
	private static let title = "Library"
	
	static var previews: some View {
		VStack {
			HStack {
				Text("Selection == true")
					.foregroundColor(.white)
				TabBarItemView(
					content: {
						Text("Library")
					},
					selection: true)
			}
			HStack {
				Text("Selection == false")
					.foregroundColor(.white)
				TabBarItemView(
					content: {
						Text("Library")
					},
					selection: false)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.black)
	}
}
