//
//  QuadrantModel.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class QuadrantModel {
    let fieldRowsCols = 3
    let fields = Observable([[FieldModel]]())
    var rotateCounterClockwiseListener: (() -> Void)?
    
    var isFull: Bool {
        let grid = fields.value
        for row in grid {
            for field in row {
                if field.isEmpty {
                    return false
                }
            }
        }
        return true
    }
    
    init(handler: PentagoGameHandler, x: Int, y: Int) {
        for fieldY in 0..<fieldRowsCols {
            var row = [FieldModel]()
            for fieldX in 0..<fieldRowsCols {
                let fieldPos = FieldPos(quadrantX: x, quadrantY: y, fieldX: fieldX, fieldY: fieldY)
                row.append(FieldModel(handler: handler, pos: fieldPos))
            }
            fields.use { $0.append(row) }
        }
    }
    
    func rotate() {
        fields.use { rotateClockwise(squareMatrix: &$0) }
        rotateCounterClockwiseListener?()
    }
}
