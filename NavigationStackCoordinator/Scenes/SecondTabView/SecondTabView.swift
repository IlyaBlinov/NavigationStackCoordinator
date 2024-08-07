//
//  SecondTabView.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import SwiftUI

struct SecondTabView: View {
	@ObservedObject var store: SecondTabViewStore = SecondTabViewStore()
	
	var interactor: ISecondTabViewInteractor!
	
	var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("I'm SecondTabView")
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
	SecondTabView(store: SecondTabViewStore())
}




