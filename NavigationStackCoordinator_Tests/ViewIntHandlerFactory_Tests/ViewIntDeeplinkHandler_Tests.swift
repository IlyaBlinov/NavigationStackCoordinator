//
//  ViewIntDeeplinkHandler_Tests.swift
//  NavigationStackCoordinator_Tests
//
//  Created by Илья Блинов on 17.08.2024.
//
import XCTest
import Foundation
@testable import NavigationStackCoordinator

// Naming Structure: test_[struct or class]_[variable or function]_[expected result]

// Testing Structure: Given, When, Then


final class ViewIntDeeplinkHandler_Tests: XCTestCase {
	
	
	var tabBarManagerSpy: TabBarManagerSpy!
	var navigationManagerSpy: NavigationManagerSpy!
	var firstTabViewIntDeeplinkMapperMock: FirstTabViewIntDeeplinkMapperMock!
	var secondTabViewIntDeeplinkMapperMock: SecondTabViewIntDeeplinkMapperMock!
	var viewIntDeeplinkHandler: ViewIntDeeplinkHandler!
	
	let viewIntFirstTabURLString = "deeplink://view_int?id:123456/tab:0/Hello_View_Int"
	let viewIntSecondTabURLString = "deeplink://view_int?id:123456/tab:1/Hello_View_Int"
	
	
	override func setUpWithError() throws {
		navigationManagerSpy = NavigationManagerSpy()
		tabBarManagerSpy = TabBarManagerSpy()
		firstTabViewIntDeeplinkMapperMock = FirstTabViewIntDeeplinkMapperMock()
		secondTabViewIntDeeplinkMapperMock = SecondTabViewIntDeeplinkMapperMock()
		
		viewIntDeeplinkHandler = ViewIntDeeplinkHandler(
			tabBarManager: tabBarManagerSpy,
			navigationManager: navigationManagerSpy,
			mapper: firstTabViewIntDeeplinkMapperMock
		)
	}
	
	override func tearDownWithError() throws {
		tabBarManagerSpy = nil
		navigationManagerSpy = nil
		viewIntDeeplinkHandler = nil
		
	}
	
	func test_ViewIntHandler_canOpenURL_shouldBeTrueForFirstTab() {
		// Given
		
		viewIntDeeplinkHandler = ViewIntDeeplinkHandler(
			tabBarManager: tabBarManagerSpy,
			navigationManager: navigationManagerSpy,
			mapper: firstTabViewIntDeeplinkMapperMock
		)
		let url = URL(string: viewIntFirstTabURLString)!
		
		// When
		let result = viewIntDeeplinkHandler.canOpenURL(url)
		// Then
		XCTAssertTrue(result)
		
	}
	
	
	func test_ViewIntHandler_canOpenURL_shouldBeTrueForSecondTab() {
		// Given
		viewIntDeeplinkHandler = ViewIntDeeplinkHandler(
			tabBarManager: tabBarManagerSpy,
			navigationManager: navigationManagerSpy,
			mapper: secondTabViewIntDeeplinkMapperMock
		)
		let url = URL(string: viewIntSecondTabURLString)!
		// When
		let result = viewIntDeeplinkHandler.canOpenURL(url)
		// Then
		XCTAssertTrue(result)
	}
	
	func test_ViewIntHandler_openURL_shouldSelectTabAndPushForFirstTab() {
		// Given
		
		viewIntDeeplinkHandler = ViewIntDeeplinkHandler(
			tabBarManager: tabBarManagerSpy,
			navigationManager: navigationManagerSpy,
			mapper: firstTabViewIntDeeplinkMapperMock
		)
		let url = URL(string: viewIntFirstTabURLString)!
		
		// When
		viewIntDeeplinkHandler.openURL(url)
		// Then
		XCTAssertTrue(tabBarManagerSpy.callSetSelectedIndex)
		XCTAssertTrue(navigationManagerSpy.callPush)
		
	}
	
	
	func test_ViewIntHandler_openURL_shouldSelectTabAndPushForSecondTab() {
		// Given
		viewIntDeeplinkHandler = ViewIntDeeplinkHandler(
			tabBarManager: tabBarManagerSpy,
			navigationManager: navigationManagerSpy,
			mapper: secondTabViewIntDeeplinkMapperMock
		)
		let url = URL(string: viewIntSecondTabURLString)!
		// When
		viewIntDeeplinkHandler.openURL(url)
		// Then
		XCTAssertTrue(tabBarManagerSpy.callSetSelectedIndex)
		XCTAssertTrue(navigationManagerSpy.callPush)
	}
	
}
	

