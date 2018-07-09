//
//  BoardModel.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class BoardModel {
    let quadrants = Observable([[QuadrantModel]]())
    
    var isFull: Bool {
        let grid = quadrants.value
        for row in grid {
            for quadrant in row {
                if !quadrant.isFull {
                    return false
                }
            }
        }
        return true
    }
    
    init(handler: PentagoGameHandler) {
        for y in 0..<2 {
            var row = [QuadrantModel]()
            for x in 0..<2 {
                row.append(QuadrantModel(handler: handler, x: x, y: y))
            }
            quadrants.use { $0.append(row) }
        }
    }
}
