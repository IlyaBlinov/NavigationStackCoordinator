//
//  LoaderFullScreenCover.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 19.07.2024.
//

import SwiftUI


protocol ILoader {}

extension Loader: ILoader {}

struct Loader: View {
	
	var interactor: ILoaderInteractor!
	
	var body: some View {
		Text("Loading.....")
	}
}

#Preview {
	Loader()
}
