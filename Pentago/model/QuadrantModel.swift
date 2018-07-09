//
//  QuadrantModel.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class QuadrantModel {
    let fields = Observable([[FieldModel]]())
    var rotateClockwiseListener: (() -> Void)?
    
    init(handler: PentagoGameHandler, x: Int, y: Int) {
        for fieldY in 0..<3 {
            var row = [FieldModel]()
            for fieldX in 0..<3 {
                let fieldPos = FieldPos(quadrantX: x, quadrantY: y, fieldX: fieldX, fieldY: fieldY)
                row.append(FieldModel(handler: handler, pos: fieldPos))
            }
            fields.use { $0.append(row) }
        }
    }
    
    func rotate() {
        fields.use { rotateClockwise(squareMatrix: &$0) }
        rotateClockwiseListener?()
    }
}
