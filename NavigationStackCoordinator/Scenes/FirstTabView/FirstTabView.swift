//
//  StartView.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import SwiftUI

struct FirstTabView: View {
	@ObservedObject var store: FirstTabViewStore = FirstTabViewStore()
	
	var interactor: IFirstTabViewInteractor!
	
	var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("I'm FirstTabView")
			Text("My Value is: \(store.value)")
			Text("Go Next Screen")
				.padding(20)
				.foregroundColor(.white)
				.background(Color.green)
				.onTapGesture {
					interactor.pushNextScreen()
				}
		}
	}
}

#Preview {
	FirstTabView(store: FirstTabViewStore())
}



