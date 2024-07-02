//
//  ViewInt.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import SwiftUI

struct ViewInt: View {
	
	@ObservedObject var store: ViewIntModel.Store = ViewIntModel.Store()
	
	var interactor: IViewIntInteractor!
	
	var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("I'm ViewInt")
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

//#Preview {
//	ViewInt()
//}


