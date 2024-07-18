//
//  FirstSheet.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 18.07.2024.
//

import SwiftUI


protocol IFirstSheet {
	
}

extension FirstSheet: IFirstSheet {}

struct FirstSheet: View {
	
	var interactor: IFirstSheetInteractor!
	
	@ObservedObject var store: FirstSheetModel.Store = FirstSheetModel.Store()
	
	@Environment(\.dismiss) private var dismiss
	
	var body: some View {
		VStack {
			Text("I'm FirstSheet")
			Text("Dismiss Sheet")
				.padding()
				.foregroundColor(.white)
				.background(Color.red)
				.onTapGesture {
					interactor.dismiss(FirstSheetModel.Dismiss.Event())
					dismiss()
				}

		}
	}
}

#Preview {
	FirstSheet()
}
