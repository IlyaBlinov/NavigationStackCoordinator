//
//  FirstTabCoordinator_Tests.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 02.08.2024.
//

import XCTest
@testable import NavigationStackCoordinator

// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then
final class FirstTabCoordinator_Tests: XCTestCase {
	
	var firstTabCoordinator: FirstTabCoordinator!
	var navigationManagerSpy: NavigationManagerSpy!
	var tabBarManagerSpy: TabBarManagerSpy!
	
	override func setUpWithError() throws {
		navigationManagerSpy = NavigationManagerSpy()
		tabBarManagerSpy = TabBarManagerSpy()
		let assembly = FirstTabCoordinatorAssemblyStub(
			navigationManager: navigationManagerSpy,
			tabBarManager: tabBarManagerSpy
		)
		firstTabCoordinator = FirstTabCoordinator(
			navigationManager: navigationManagerSpy,
			tabBarManager: tabBarManagerSpy,
			assembly: assembly
		)
		
		assembly.coordinator = firstTabCoordinator
	}
	
	func test_firstTabCoordinator_view_showFirstTabView_shouldBeTrue() {
		// Given
		// When
		// Then
		XCTAssertTrue(firstTabCoordinator.view() is FirstTabView)
	}
	
	func test_firstTabCoordinator_showViewString_shouldBeInNavigationStack() {
		// Given
		// When
		firstTabCoordinator.showViewString()
		let pushedValue =  navigationManagerSpy.pushedValue?.base as? FirstFlowCoordinator
		// Then
		XCTAssertTrue(navigationManagerSpy.callPush)
		XCTAssertNotNil(pushedValue)
		XCTAssertTrue(pushedValue?.page == .viewString)
		
	}
	
	override func tearDownWithError() throws {
		firstTabCoordinator = nil
		navigationManagerSpy = nil
		tabBarManagerSpy = nil
	}
	
	
	
}

