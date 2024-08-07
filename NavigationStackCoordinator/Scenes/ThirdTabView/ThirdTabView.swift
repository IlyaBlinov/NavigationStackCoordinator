//
//  ThirdTabView.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 07.08.2024.
//

import SwiftUI

struct ThirdTabView: View {
	@ObservedObject var store: ThirdTabViewStore = ThirdTabViewStore()
	
	var interactor: IThirdTabViewInteractor!
	
	var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("I'm ThirdTabView")
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
	ThirdTabView(store: ThirdTabViewStore())
}



