//
//  Observable.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class ReadOnlyObservable<T> {
    private var storedValue: T
    private var listeners = [(T) -> Void]()
    fileprivate(set) var value: T {
        get { return storedValue }
        set {
            fireListeners(with: newValue)
            storedValue = newValue
        }
    }
    
    init(_ value: T) {
        storedValue = value
    }
    
    fileprivate func use(_ consumer: (inout T) -> Void) {
        consumer(&value)
        fireListeners(with: value)
    }
    
    func addListener(_ listener: @escaping (T) -> Void) {
        self.listeners.append(listener)
    }
    
    fileprivate func addAndFireListener(_ listener: @escaping (T) -> Void) {
        addListener(listener)
        listener(value)
    }
    
    fileprivate func fireListeners(with newValue: T) {
        for listener in listeners {
            listener(newValue)
        }
    }
}

class Observable<T>: ReadOnlyObservable<T> {
    override var value: T {
        get { return super.value }
        set { super.value = newValue }
    }
    
    override func use(_ consumer: (inout T) -> Void) {
        super.use(consumer)
    }
    
    override func addAndFireListener(_ listener: @escaping (T) -> Void) {
        super.addAndFireListener(listener)
    }
    
    override func fireListeners(with newValue: T) {
        super.fireListeners(with: newValue)
    }
}
