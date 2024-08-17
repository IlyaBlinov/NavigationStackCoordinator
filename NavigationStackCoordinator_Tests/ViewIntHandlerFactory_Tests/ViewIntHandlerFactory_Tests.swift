//
//  ViewIntHandlerFactory_Tests.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 17.08.2024.
//

import XCTest
@testable import NavigationStackCoordinator

// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then


final class ViewIntHandlerFactory_Tests: XCTestCase {
	
	var tabBarManagerSpy: TabBarManagerSpy!
	var navigationManagerSpy: NavigationManagerSpy!
	var viewIntHadlerFactory: IViewIntHandlerFactory!
	
	
	override func setUpWithError() throws {
		navigationManagerSpy = NavigationManagerSpy()
		tabBarManagerSpy = TabBarManagerSpy()
		
		viewIntHadlerFactory = ViewIntHandlerFactory(
			navigationManager: navigationManagerSpy,
			tabBarManager: tabBarManagerSpy,
			deeplinkMapper: ViewIntDeeplinkMapperDummy()
		)
	}
	
	override func tearDownWithError() throws {
		tabBarManagerSpy = nil
		navigationManagerSpy = nil
		viewIntHadlerFactory = nil
	}
	
	func test_ViewIntHandlerFactory_produce_deeplinkHandlerIsNotNil() {
		// Given
		// When
		let handler = viewIntHadlerFactory.produce()
		// Then
		XCTAssertNotNil(handler)
		XCTAssertTrue(handler is ViewIntDeeplinkHandler)
	}

}





