//
//  CustomNavigationBarView.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 04.06.2024.
//

import Foundation
import SwiftUI

struct CustomNavigationBarView: View {
	
	let title: String
	let subtitle: String?
	let backButtonHidden: Bool
	
	var backButtonAction: () -> Void
	
	//@Environment(\.presentationMode) var presentationMode
	
	
	
	var body: some View {
		let _ = Self._printChanges()
		HStack {
			if !backButtonHidden {
				backButton
			}
			Spacer()
			titleSection
			Spacer()
			if !backButtonHidden {
				backButton.opacity(0)
			}
		}
		.padding()
		.font(.headline)
		.accentColor(.white)
		.foregroundColor(.white)
		.background(Color.green.opacity(0.7).ignoresSafeArea(edges: .top))
	}
	
	
	private var backButton: some View {
		Button(action: {
			backButtonAction()
			//presentationMode.wrappedValue.dismiss()
		}, label: {
			Image(systemName: "chevron.left")
		})
	}
	
	private var titleSection: some View {
		VStack(spacing: 4) {
			Text(title)
				.font(.title)
				.fontWeight(.semibold)
			if let subtitle = subtitle {
				Text(subtitle)
			}
			
		}
	}
}

#Preview {
	VStack {
		CustomNavigationBarView(
			title: "Title",
			subtitle: "SubTitle",
			backButtonHidden: false, backButtonAction: {}
		)
		Spacer()
	}
}


struct CustomNavigationBarTitlePreferenceKey: PreferenceKey {
	static var defaultValue: String = ""
	static func reduce(value: inout String, nextValue: () -> String) {
		value = nextValue()
	}
}

struct CustomNavigationBarSubTitlePreferenceKey: PreferenceKey {
	static var defaultValue: String? = nil
	static func reduce(value: inout String?, nextValue: () -> String?) {
		value = nextValue()
	}
}


struct CustomNavigationBarBackButtonHiddenPreferenceKey: PreferenceKey {
	static var defaultValue: Bool = false
	static func reduce(value: inout Bool, nextValue: () -> Bool) {
		value = nextValue()
	}
}


extension View {
	
	func customNavigationBarTitle(_ title: String) -> some View {
		preference(key: CustomNavigationBarTitlePreferenceKey.self, value: title)
	}
	
	func customNavigationBarSubTitle(_ subTitle: String?) -> some View {
		preference(key: CustomNavigationBarSubTitlePreferenceKey.self, value: subTitle)
	}
	
	func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
		preference(key: CustomNavigationBarBackButtonHiddenPreferenceKey.self, value: hidden)
	}
	
	func customNavigationBarItems(title: String = "", subTitle: String? = nil, backButtonHidden: Bool = false) -> some View {
		self
			.customNavigationBarTitle(title)
			.customNavigationBarSubTitle(subTitle)
			.customNavigationBarBackButtonHidden(backButtonHidden)
	}
	
}
