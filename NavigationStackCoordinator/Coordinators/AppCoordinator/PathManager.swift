//
//  PathManager.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 27.06.2024.
//

import SwiftUI
import Combine


enum SheetAction: Identifiable {
	
	case viewDouble(ViewDouble)
	
	var id: UUID {
		UUID()
	}
}


enum FullScreenCoverAction: Identifiable {
	
	case viewString(ViewString)
	
	var id: UUID {
		UUID()
	}
}

final class PathManager: ObservableObject {
	
	var pathPublisher: Published<NavigationPath>.Publisher { $path }
	
	
	private let savePath = URL.documentsDirectory.appending(path: "SavedPath_FirstTabPath")
	
	@Published var path: NavigationPath = NavigationPath()
	
	@Published var sheetAction: SheetAction?
	
	@Published var fullScreenCover: FullScreenCoverAction?
	
	private var savedPath: NavigationPath = NavigationPath()
	
	private var previousPath: NavigationPath = NavigationPath()
	
	var cancellable = Set<AnyCancellable>()
	
	weak var delegate: IPathManagerDelegate?
	
	init() {
		clearSavedPath()
		if let data = try? Data(contentsOf: savePath) {
			if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
				self.path = NavigationPath(decoded)
				return
			}
		}
		
	}
	
	init(path: NavigationPath) {
		clearSavedPath()
		self.path = path
		if let data = try? Data(contentsOf: savePath) {
			if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
				self.path = NavigationPath(decoded)
				
			}
		}
		
		$path.sink { path in
			
			if self.previousPath.count > path.count {
				var tempPreviousPath: NavigationPath = self.previousPath
				tempPreviousPath.removeLast(self.previousPath.count - 1)
				let poppedNavigationPath = tempPreviousPath
				
				let poppedModelStr = self.makeArrayFromPathComponents(path: self.previousPath).first
				
				let data = try! JSONEncoder().encode(poppedNavigationPath.codable)
				let pathDataStr = String(decoding: data, as: UTF8.self)
					.replacingOccurrences(of: "[", with: "")
					.replacingOccurrences(of: "]", with: "")
					.replacingOccurrences(of: "\\", with: "")
					.replacingOccurrences(of: "\"", with: "")
				
				self.delegate?.didPop(navigationPath: poppedNavigationPath)
				
				//guard let type = _typeByName(typeName)
				print("didPop: \(poppedModelStr!) \(pathDataStr)")
				
				
				// didPop
			} else if self.previousPath.count < path.count {
				// didPush
				print("didPush")
			}
			self.previousPath = path
			
			if let pathData = try? JSONEncoder().encode(path.codable!) {
				let pathDataStr = String(decoding: pathData, as: UTF8.self)
					.replacingOccurrences(of: "[", with: "")
					.replacingOccurrences(of: "]", with: "")
					.replacingOccurrences(of: "\\", with: "")
					.replacingOccurrences(of: "\"", with: "")
				
			}
		}.store(in: &cancellable)
		
	}
	
	func save(path: NavigationPath) {
		do {
			let data = try JSONEncoder().encode(path.codable)
			try data.write(to: savePath)
		} catch {
			print("Failed to save navigation data")
		}
	}
	
	private func isKey(element: String) -> Bool {
		if !element.contains("{") && !element.contains("}") {
			return true
		} else {
			return false
		}
	}
	
	func searchValueCount(element: String) -> Int {
		element.filter { $0 == "{" }.count + 1
	}
	
	func checkPath<Subject: ICoordinatorModel>(_ subject: Subject.Type, completion: @escaping() -> Void) -> AnyCancellable {
		$path.sink { path in
			if let pathData = try? JSONEncoder().encode(path.codable!) {
				let pathDataStr = String(decoding: pathData, as: UTF8.self)
					.replacingOccurrences(of: "[", with: "")
					.replacingOccurrences(of: "]", with: "")
					.replacingOccurrences(of: "\\", with: "")
					.replacingOccurrences(of: "\"", with: "")
				if !pathDataStr.contains(String(reflecting: subject)) {
					completion()
				}
			}
		}
	}
	
	func checkCoordinatorPaths<Subject: ICoordinatorModel>(_ subject: Subject, completion: @escaping() -> Void) -> AnyCancellable {
		$path.sink { path in
			if let pathData = try? JSONEncoder().encode(path.codable!) {
				let pathDataStr = String(decoding: pathData, as: UTF8.self)
					.replacingOccurrences(of: "[", with: "")
					.replacingOccurrences(of: "]", with: "")
					.replacingOccurrences(of: "\\", with: "")
					.replacingOccurrences(of: "\"", with: "")
				if !pathDataStr.contains(String(reflecting: subject)) {
					completion()
				}
			}
		}
	}
	
	func checkCoordinatorInStack<Subject: ICoordinatorModel>(_ subject: Subject.Type) -> Bool {
		guard let pathData = try? JSONEncoder().encode(path.codable!) else { return false }
		let pathDataStr = String(decoding: pathData, as: UTF8.self)
			.replacingOccurrences(of: "[", with: "")
			.replacingOccurrences(of: "]", with: "")
			.replacingOccurrences(of: "\\", with: "")
			.replacingOccurrences(of: "\"", with: "")
		return pathDataStr.contains(String(reflecting: subject))
	}
	
	
	//	func getCurrentPath(path: NavigationStackBackport.NavigationPath) -> String {
	//		let pathArray = makeArrayFromPathComponents(path: path)
	//		return pathArray.first ?? ""
	//	}
	//
	//	func getPreviousPath(path: NavigationStackBackport.NavigationPath) -> String {
	//		let pathArray = makeArrayFromPathComponents(path: path)
	//		if pathArray.count >= 3 {
	//			return pathArray[2]
	//		} else {
	//			return ""
	//		}
	//
	//	}
	
	
	private func makeDictionaryFromPathComponents(pathString: String) -> [String: Any] {
		let array = pathString.components(separatedBy: ",")
		var dictionary = [String: Any]()
		var i = 0
		while i < array.count - 1 {
			if self.isKey(element: array[i]) {
				
				let key = array[i]
				i += 1
				
				var value: [String] = []
				
				
				while !self.isKey(element: array[i]) {
					
					value.append(array[i])
					
					
					if i < array.count - 1 {
						i += 1
					} else {
						break
					}
					
				}
				
				dictionary[key] = value.joined(separator: ",")
				
			}
		}
		
		return dictionary
	}
	
	private func makeArrayFromPathComponents(path: NavigationPath) -> [String] {
		
		guard let pathCodable = path.codable, let pathData = try? JSONEncoder().encode(pathCodable) else {
			return []
		}
		
		let pathString = String(decoding: pathData, as: UTF8.self)
			.replacingOccurrences(of: "[", with: "")
			.replacingOccurrences(of: "]", with: "")
			.replacingOccurrences(of: "\\", with: "")
			.replacingOccurrences(of: "\"", with: "")
		
		let array = pathString.components(separatedBy: ",")
		var pathArray = [String]()
		var i = 0
		while i < array.count - 1 {
			if self.isKey(element: array[i]) {
				
				let key = array[i]
				i += 1
				
				var value: [String] = []
				
				
				while !self.isKey(element: array[i]) {
					
					value.append(array[i])
					
					
					if i < array.count - 1 {
						i += 1
					} else {
						break
					}
					
				}
				
				pathArray.append(key)
				pathArray.append(value.joined(separator: ","))
				
			}
		}
		
		return pathArray
	}
	
	
	
	
	func typePathString(path: NavigationPath) -> String? {
		if let pathData = try? JSONEncoder().encode(path.codable!) {
			let pathDataStr = String(decoding: pathData, as: UTF8.self)
				.replacingOccurrences(of: "[", with: "")
				.replacingOccurrences(of: "]", with: "")
				.replacingOccurrences(of: "\\", with: "")
				.replacingOccurrences(of: "\"", with: "")
			return pathDataStr
		} else {
			return nil
		}
	}
	
	func restorePath() -> Published<NavigationPath> {
		_path
	}
	
	func findPath() -> Published<NavigationPath>.Publisher {
		$path
	}
	
	func push<T: Hashable>(_ value: T) {
		path.append(value)
	}
	
	func pop() {
		path.removeLast()
	}
	
	func popToRoot() {
		path.removeLast(path.count)
	}
	
	
	func clearSavedPath() {
		save(path: NavigationPath())
	}
	
	func pushAndSave<T: Hashable>(_ value: T) {
		path.append(value)
		self.savedPath.append(value)
		self.save(path: savedPath)
	}
	
}



protocol IPathManagerDelegate: AnyObject {
	func didPop(navigationPath: NavigationPath)
}


protocol ICoordinatorModel: Identifiable & Hashable & Codable {
	associatedtype ValueModel = Identifiable & Hashable & Codable
	var value: ValueModel { get set }
	init (value: ValueModel)
}
