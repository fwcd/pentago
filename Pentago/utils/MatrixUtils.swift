//
//  MatrixUtils.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

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
            squareMatrix[y][x] /* top */ = squareMatrix[gX][y] /* right */
            squareMatrix[gX][y] /* right */ = squareMatrix[gY][gX] /* bottom */
            squareMatrix[gY][gX] /* bottom */ = squareMatrix[x][gY] /* left */
            squareMatrix[x][gY] /* left*/ = top;
        }
    }
}

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
            squareMatrix[y][x] /* top */ = squareMatrix[x][gY] /* left */
            squareMatrix[x][gY] /* left*/ = squareMatrix[gY][gX] /* bottom */;
            squareMatrix[gY][gX] /* bottom */ = squareMatrix[gX][y] /* right */
            squareMatrix[gX][y] /* right */ = top
        }
    }
}
