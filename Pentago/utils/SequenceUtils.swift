//
//  SequenceUtils.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

extension Sequence {
    // A modified version of the original map() implementation
    // Source: https://github.com/apple/swift/blob/master/stdlib/public/core/Sequence.swift
    func mapWithIndex<T>(_ transform: (Element, Int) throws -> T) rethrows -> [T] {
        var result = ContiguousArray<T>()
        result.reserveCapacity(underestimatedCount)
        var iterator = makeIterator()
        var index: Int = 0
        while let element = iterator.next() {
            result.append(try transform(element, index))
            index += 1
        }
        return Array(result)
    }
    
    func compactMapWithIndex<T, S: Sequence>(_ transform: (Element, Int) throws -> S) rethrows -> [T] where S.Element == T {
        var result = ContiguousArray<T>()
        var iterator = makeIterator()
        var index: Int = 0
        while let element = iterator.next() {
            result.append(contentsOf: try transform(element, index))
            index += 1
        }
        return Array(result)
    }
}

extension Collection {
    func reduce(_ accumulator: (Element, Element) -> Element) -> Element {
        return dropFirst().reduce(first!, accumulator)
    }
}

extension Array {
    func safeGet(_ index: Int) -> Element? {
        if index >= 0 && index < count {
            return self[index]
        } else {
            return nil
        }
    }
}
