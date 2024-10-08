//
//  FirstTabCoordinatorAssembly_Tests.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 04.08.2024.
//

import XCTest
@testable import NavigationStackCoordinator

// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then

final class FirstTabCoordinatorAssembly_Tests: XCTestCase {
	
	var assembly: FirstTabCoordinatorAssembly!
	var tabBarManagerSpy: TabBarManagerSpy!
	var navigationManagerSpy: NavigationManagerSpy!
	var firstTabCoordinator: FirstTabCoordinatorStub!

	override func setUpWithError() throws {
		navigationManagerSpy = NavigationManagerSpy()
		tabBarManagerSpy = TabBarManagerSpy()
		firstTabCoordinator = FirstTabCoordinatorStub()
		assembly = FirstTabCoordinatorAssembly()
		
		
		assembly.coordinator = firstTabCoordinator
	}
	
	override func tearDownWithError() throws {
		assembly = nil
	}
	
	
	func test_firstTabCoordinatorAssembly_assemblyFirstFlowCoordinator_shouldBeTrue() {
		// Given
		// When
		let coordinator = assembly.assemblyFirstFlowCoordinator(page: .viewInt, navigationManager: navigationManagerSpy, tabBarManager: tabBarManagerSpy)
		// Then
		XCTAssertTrue(coordinator is FirstFlowCoordinator)
		XCTAssertNotNil(coordinator)
		XCTAssertTrue(coordinator.page == .viewInt)
	}
	
//	func test_firstTabCoordinatorAssembly_assemblyFirstTabView_shouldBeTrue() {
//		// Given
//		// When
//		let view = assembly.assemblyFirstTabView(model: .init(value: ""))
//		// Then
//		XCTAssertTrue(view is FirstTabView)
//		XCTAssertNotNil(view)
//	}
	
}
