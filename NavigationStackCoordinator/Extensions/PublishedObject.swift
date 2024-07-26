//
//  PublishedObject.swift
//  NavigationStackCoordinator
//
//  Created by Илья Блинов on 21.07.2024.
//

import Combine

@propertyWrapper
public struct PublishedObject<Value: ObservableObject> { // wrappedValue requires to conform to ObservableObject
	public var wrappedValue: Value
	
	public init(wrappedValue: Value) {
		self.wrappedValue = wrappedValue
	}
	
	public static subscript<OuterSelf: ObservableObject>(
		_enclosingInstance observed: OuterSelf,
		wrapped wrappedKeyPath: ReferenceWritableKeyPath<OuterSelf, Value>,
		storage storageKeyPath: ReferenceWritableKeyPath<OuterSelf, Self>
	) -> Value where OuterSelf.ObjectWillChangePublisher == ObservableObjectPublisher {
		get {
			if observed[keyPath: storageKeyPath].cancellable == nil {
				// This is executed only once.
				observed[keyPath: storageKeyPath].setup(observed)
			}
			return observed[keyPath: storageKeyPath].wrappedValue
		}
		set {
			observed.objectWillChange.send() // willSet
			observed[keyPath: storageKeyPath].wrappedValue = newValue
		}
	}
	
	private var cancellable: AnyCancellable?
	// Subscribe to objectWillChange of wrappedvalue.
	// When wrappedValue sends a notification, call the _enclosingInstance's objectWillChange.send().
	// Use a closure to weakly reference _enclosingInstance.
	private mutating func setup<OuterSelf: ObservableObject>(_ enclosingInstance: OuterSelf) where OuterSelf.ObjectWillChangePublisher == ObservableObjectPublisher {
		cancellable = wrappedValue.objectWillChange.sink(receiveValue: { [weak enclosingInstance] _ in
			(enclosingInstance?.objectWillChange)?.send()
		})
	}
}
