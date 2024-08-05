//
//  FirstFlowCoordinator_Tests.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 04.08.2024.
//

import XCTest
@testable import NavigationStackCoordinator
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then
final class FirstFlowCoordinator_Tests: XCTestCase {
	
	var coordinator: FirstFlowCoordinator!
	var navigationManagerSpy: NavigationManagerSpy!
	var tabBarManagerSpy: TabBarManagerSpy!
	
	override func setUpWithError() throws {
		navigationManagerSpy = NavigationManagerSpy()
		
		let assembly = FirstFlowCoordinatorAssembly()
		navigationManagerSpy = NavigationManagerSpy()
		tabBarManagerSpy = TabBarManagerSpy()
		coordinator = FirstFlowCoordinator(
			page: .viewInt,
			navigationManager: navigationManagerSpy,
			assembly: assembly,
			tabBarManager: tabBarManagerSpy
		)
		assembly.coordinator = coordinator
	}
	
	override func tearDownWithError() throws {
		coordinator = nil
		navigationManagerSpy = nil
		tabBarManagerSpy = nil
	}
	
	func test_firstFlowCoordinator_showViewInt_shouldBeInNavigationStack() {
		// Given
		// When
		coordinator.showViewInt()
		let pushedValue =  navigationManagerSpy.pushedValue?.base as? FirstFlowCoordinator
		// Then
		XCTAssertTrue(navigationManagerSpy.callPush)
		XCTAssertNotNil(pushedValue)
		XCTAssertTrue(pushedValue?.page == .viewInt)
		
	}
	
	func test_firstFlowCoordinator_showViewDouble_shouldBeInNavigationStack() {
		// Given
		// When
		coordinator.showViewDouble()
		let pushedValue =  navigationManagerSpy.pushedValue?.base as? FirstFlowCoordinator
		// Then
		XCTAssertTrue(navigationManagerSpy.callPush)
		XCTAssertNotNil(pushedValue)
		XCTAssertTrue(pushedValue?.page == .viewDouble)
	}
	
	func test_firstFlowCoordinator_showViewString_shouldBeInNavigationStack() {
		// Given
		// When
		coordinator.showViewString()
		let pushedValue = navigationManagerSpy.pushedValue?.base as? FirstFlowCoordinator
		// Then
		XCTAssertTrue(navigationManagerSpy.callPush)
		XCTAssertNotNil(pushedValue)
		XCTAssertTrue(pushedValue?.page == .viewString)
	}
	
	func test_firstFlowCoordinator_selectNewTab_shouldBeEqualToGivenIndex() {
		// Given
		let index = 0
		// When
		coordinator.selectNewTab(index: index)
		// Then
		XCTAssertTrue(tabBarManagerSpy.callSetSelectedIndex)
		XCTAssertTrue(tabBarManagerSpy.selectedIndex == index)
		
	}
	
	func test_firstFlowCoordinator_showFirstSheet_sheetShouldBeNotNil() {
		// Given
		// When
		coordinator.showFirstSheet()
		let sheetCoordinator = navigationManagerSpy.showedSheet?.base as? FirstFlowSheetCoordinator
		// Then
		XCTAssertTrue(navigationManagerSpy.callShowSheet)
		XCTAssertNotNil(sheetCoordinator)
		XCTAssertTrue(sheetCoordinator?.sheet == .firstSheet)
	}
	
	func test_firstFlowCoordinator_showSecondSheet_sheetShouldBeNotNil() {
		// Given
		// When
		coordinator.showSecondSheet()
		let sheetCoordinator = navigationManagerSpy.showedSheet?.base as? FirstFlowSheetCoordinator
		// Then
		XCTAssertTrue(navigationManagerSpy.callShowSheet)
		XCTAssertNotNil(sheetCoordinator)
		XCTAssertTrue(sheetCoordinator?.sheet == .secondSheet)
	}
	
	func test_firstFlowCoordinator_dismissSheet_sheetShouldBeNil() {
		// Given
		// When
		coordinator.showFirstSheet()
		let sheetCoordinator = navigationManagerSpy.showedSheet?.base as? FirstFlowSheetCoordinator
		XCTAssertTrue(navigationManagerSpy.callShowSheet)
		XCTAssertNotNil(sheetCoordinator)
		XCTAssertTrue(sheetCoordinator?.sheet == .firstSheet)
		// Then
		coordinator.dismissSheet()
		XCTAssertTrue(navigationManagerSpy.callHideSheet)
		XCTAssertNil(navigationManagerSpy.showedSheet)
	}
	
	func test_firstFlowCoordinator_showLoader_fullScreenCover_shouldNotBeNil() {
		// Given
		// When
		coordinator.showLoader()
		let fullScreenCoverCoordinator = navigationManagerSpy.showedFullScreenCover?.base as? FirstFlowFullScreenCoverCoordinator
		
		// Then
		XCTAssertTrue(navigationManagerSpy.callShowFullScreenCover)
		XCTAssertNotNil(fullScreenCoverCoordinator)
		XCTAssertTrue(fullScreenCoverCoordinator?.fullScreenCover == .loader)
	}
	
	func test_firstFlowCoordinator_hideLoader_fullScreenCover_shouldBeNil() {
		// Given
		// When
		coordinator.hideLoader()
		let fullScreenCoverCoordinator = navigationManagerSpy.showedFullScreenCover?.base as? FirstFlowFullScreenCoverCoordinator
		
		// Then
		XCTAssertTrue(navigationManagerSpy.callHideFullScreenCover)
		XCTAssertNil(fullScreenCoverCoordinator)
	}
}
