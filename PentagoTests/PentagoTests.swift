//
//  PentagoTests.swift
//  PentagoTests
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import XCTest
@testable import Pentago

class PentagoTests: XCTestCase {
    func testMatrixRotations() {
        var a = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ]
        let b = [
            [6, 3, 0],
            [7, 4, 1],
            [8, 5, 2]
        ]
        rotateClockwise(squareMatrix: &a)
        XCTAssertEqual(a, b)
    }
    
    func testMatrixConcatenations() {
        let a = [
            [1, 2],
            [3, 4],
            [5, 6]
        ]
        let b = [
            [8, 9],
            [3, 2],
            [0, 1]
        ]
        let horizontalConcat = [
            [1, 2, 8, 9],
            [3, 4, 3, 2],
            [5, 6, 0, 1]
        ]
        let verticalConcat = [
            [1, 2],
            [3, 4],
            [5, 6],
            [8, 9],
            [3, 2],
            [0, 1]
        ]
        XCTAssertEqual(horizontalConcat, concatHorizontally(a, b))
        XCTAssertEqual(verticalConcat, concatVertically(a, b))
    }
    
    func testBoardModel() {
        let board = PentagoModel().board
        let quadrants = board?.quadrants.value
        let fields = quadrants?.first?.first?.fields.value
        
        let quadrantsX = quadrants?.count ?? 0
        let quadrantsY = quadrants?.first?.count ?? 0
        let fieldsPerQuadrantX = fields?.count ?? 0
        let fieldsPerQuadrantY = fields?.first?.count ?? 0
        
        let rows = quadrantsX * fieldsPerQuadrantX
        let cols = quadrantsY * fieldsPerQuadrantY
        
        let allFields = board?.joinToFields()
        XCTAssertEqual(rows, allFields?.count ?? 0)
        XCTAssertEqual(cols, allFields?.first?.count ?? 0)
    }
}
