//
//  AppCoordinator_tests.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 02.08.2024.
//

import XCTest
import SwiftUI
@testable import NavigationStackCoordinator
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then
final class AppCoordinator_tests: XCTestCase {
	
	var appCoordinator: AppCoordinator!
	
	override func setUpWithError() throws {
		let mainContainer = MainContainer()
		let appCoordinatorAssembly = AppCoordinatorAssembly(mainContainer: mainContainer)
		appCoordinator = AppCoordinator(assembly: appCoordinatorAssembly)
	}
	
	override func tearDownWithError() throws {
		appCoordinator = nil
	}
	
	func test_appcoordinator_view_showMainView_shouldBeTrue() throws {
		// Given
		// When
		let view = appCoordinator.view()
		// Then
		XCTAssertTrue(view is MainView<FirstTabNavigationView<FirstTabView>, SecondTabNavigationView<SecondTabView>, ThirdTabNavigationView<ThirdTabView>>)
		XCTAssertNotNil(view)
		
	}
	

	
}
