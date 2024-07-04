//
//  ViewInt.swift
//  CoordinatorPatternInSwiftUI
//
//  Created by Илья Блинов on 01.06.2024.
//

import SwiftUI


protocol IViewInt {
	func start(_ props: ViewIntModel.Start.Props)
	func changeValue(_ props: ViewIntModel.ChangeValue.Props)
	func showSheet(_ event: ViewIntModel.ShowSheet.Props)
}

extension ViewInt: IViewInt {
	
	func start(_ props: ViewIntModel.Start.Props) {}
	
	func changeValue(_ props: ViewIntModel.ChangeValue.Props) {
		store.value = props.value
	}
	
	func showSheet(_ event: ViewIntModel.ShowSheet.Props) {
		store.showSheet.toggle()
	}
}

struct ViewInt: View {
	
	@ObservedObject var store: ViewIntModel.Store = ViewIntModel.Store()
	
	var interactor: IViewIntInteractor!
	
	var body: some View {
		let _ = Self._printChanges()
		VStack {
			Text("I'm ViewInt")
			HStack {
				Button("+") {
					let newValue = store.value + 1
					interactor.changeValue(ViewIntModel.ChangeValue.Event(value: newValue))
				}
				Text("My Value is: \(store.value)")
				Button("-") {
					let newValue = store.value - 1
					interactor.changeValue(ViewIntModel.ChangeValue.Event(value: newValue))
				}
			}
			Text("Go Next Screen")
				.padding(20)
				.foregroundColor(.white)
				.background(Color.green)
				.onTapGesture {
					interactor.pushNextScreen()
				}
			
			Text("Show Sheet")
				.padding(20)
				.foregroundColor(.white)
				.background(Color.blue)
				.onTapGesture {
					interactor.showSheet(ViewIntModel.ShowSheet.Event())
				}
			
		}
	}
}

//#Preview {
//	ViewInt()
//}


