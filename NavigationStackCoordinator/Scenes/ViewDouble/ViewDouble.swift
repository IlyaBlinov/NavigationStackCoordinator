//
//  ViewDouble.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import SwiftUI

struct ViewDouble: View {
	
	@ObservedObject var store: ViewDoubleModel.Store = ViewDoubleModel.Store()
	
	var interactor: IViewDoubleInteractor!
	
	var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("I'm ViewDouble")
			Text("My Value is: \(store.value)")
			Text("Go Next Screen")
				.padding(20)
				.foregroundColor(.white)
				.background(Color.green)
				.onTapGesture {
					interactor.pushNextScreen()
				}
			Text("Show Loader")
				.padding(20)
				.foregroundColor(.white)
				.background(Color.blue)
				.onTapGesture {
					interactor.requestToServer()
				}
		}
		.task {
			interactor.requestToServer()
		}
	}
}

#Preview {
	ViewDouble()
}



