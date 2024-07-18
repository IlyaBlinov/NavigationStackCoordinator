//
//  SecondSheet.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import SwiftUI

protocol ISecondSheet {
	
}

extension SecondSheet: ISecondSheet {}

struct SecondSheet: View {
	
	var interactor: ISecondSheetInteractor!
	
	@ObservedObject var store: SecondSheetModel.Store = SecondSheetModel.Store()
	
	@Environment(\.dismiss) private var dismiss
	
	var body: some View {
		VStack {
			Text("I'm SecondSheet")
			Text("Dismiss Sheet")
				.padding()
				.foregroundColor(.white)
				.background(Color.red)
				.onTapGesture {
					interactor.dismiss(SecondSheetModel.Dismiss.Event())
					dismiss()
				}
			
		}
	}
}

#Preview {
	SecondSheet()
}
