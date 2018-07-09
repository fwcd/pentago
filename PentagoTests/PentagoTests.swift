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
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
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
}
