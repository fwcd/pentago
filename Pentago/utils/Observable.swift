//
//  Observable.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class Observable<T> {
    private var storedValue: T
    private var listeners = [(T) -> Void]()
    var value: T {
        get { return storedValue }
        set {
            fireListeners(with: newValue)
            storedValue = newValue
        }
    }
    
    init(_ value: T) {
        storedValue = value
    }
    
    func use(_ consumer: (inout T) -> Void) {
        consumer(&value)
        fireListeners(with: value)
    }
    
    func addListener(_ listener: @escaping (T) -> Void) {
        self.listeners.append(listener)
    }
    
    func addAndFireListener(_ listener: @escaping (T) -> Void) {
        addListener(listener)
        listener(value)
    }
    
    func fireListeners(with newValue: T) {
        for listener in listeners {
            listener(newValue)
        }
    }
}
