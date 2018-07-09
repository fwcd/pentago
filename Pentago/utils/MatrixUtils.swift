//
//  MatrixUtils.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

func rotateClockwise<T>(squareMatrix: inout [[T]]) {
    let len = squareMatrix.count
    for row in squareMatrix {
        if row.count != len {
            fatalError("Trying to rotate a non-square matrix")
        }
    }
    
    for x in 0..<(len / 2) {
        let gX = len - x - 1
        for y in 0..<gX {
            let gY = len - y - 1
            let top = squareMatrix[y][x] /* top */
            squareMatrix[y][x] /* top */ = squareMatrix[gX][y] /* right */
            squareMatrix[gX][y] /* right */ = squareMatrix[gY][gX] /* bottom */
            squareMatrix[gY][gX] /* bottom */ = squareMatrix[x][gY] /* left */
            squareMatrix[x][gY] /* left*/ = top;
        }
    }
}

func rotateCounterClockwise<T>(squareMatrix: inout [[T]]) {
    let len = squareMatrix.count
    for row in squareMatrix {
        if row.count != len {
            fatalError("Trying to rotate a non-square matrix")
        }
    }
    
    for x in 0..<(len / 2) {
        let gX = len - x - 1
        for y in 0..<gX {
            let gY = len - y - 1
            let top = squareMatrix[y][x] /* top */
            squareMatrix[y][x] /* top */ = squareMatrix[x][gY] /* left */
            squareMatrix[x][gY] /* left*/ = squareMatrix[gY][gX] /* bottom */;
            squareMatrix[gY][gX] /* bottom */ = squareMatrix[gX][y] /* right */
            squareMatrix[gX][y] /* right */ = top
        }
    }
}

func concatHorizontally<T>(_ a: [[T]], _ b: [[T]]) -> [[T]] {
    if a.count != b.count {
        fatalError("Two matrices need to have the same height to be concatenated horizontally: \(a.count) vs \(b.count)")
    }
    
    var result = [[T]]()
    let len = a.count
    
    for y in 0..<len {
        var row = [T]()
        
        row.append(contentsOf: a[y])
        row.append(contentsOf: b[y])
        result.append(row)
    }
    
    return result
}

func concatVertically<T>(_ a: [[T]], _ b: [[T]]) -> [[T]] {
    var result = [[T]]()
    
    result.append(contentsOf: a)
    result.append(contentsOf: b)
    
    return result
}
