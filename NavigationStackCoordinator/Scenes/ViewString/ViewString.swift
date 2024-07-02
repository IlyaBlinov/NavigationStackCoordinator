//
//  ViewString.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import SwiftUI

struct ViewString: View {
	
	@ObservedObject var store: ViewStringModel.Store = ViewStringModel.Store()
	
	var interactor: IViewStringInteractor!
	
	var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("I'm ViewString")
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
	ViewString()
}



