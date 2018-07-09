//
//  BoardModel.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class BoardModel {
    let quadrantRows = 2
    let quadrantCols = 2
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
        for y in 0..<quadrantRows {
            var row = [QuadrantModel]()
            for x in 0..<quadrantCols {
                row.append(QuadrantModel(handler: handler, x: x, y: y))
            }
            quadrants.use { $0.append(row) }
        }
    }
    
    func joinToFields() -> [[FieldModel]] {
        return quadrants.value
            .map { row in
                row.map { $0.fields.value }.reduce { concatHorizontally($0, $1) }
            }
            .reduce { concatVertically($0, $1) }
    }
    
    func findChain(ofLength length: Int) -> PieceColor? {
        let fields = joinToFields()
        for y in 0..<fields.count {
            for x in 0..<fields[y].count {
                if hasAnyChainAt(x, y, color: .black, length: length, fields: fields) {
                    return PieceColor.black
                } else if hasAnyChainAt(x, y, color: .white, length: length, fields: fields) {
                    return PieceColor.white
                }
            }
        }
        return nil
    }
    
    private func hasAnyChainAt(_ x: Int, _ y: Int, color: PieceColor, length: Int, fields: [[FieldModel]]) -> Bool {
        return hasChainAt(x, y, dx: 1, dy: 0, color: color, length: length, fields: fields) // Horizontal
            || hasChainAt(x, y, dx: 0, dy: 1, color: color, length: length, fields: fields) // Vertical
            || hasChainAt(x, y, dx: 1, dy: 1, color: color, length: length, fields: fields) // Diagonal right
            || hasChainAt(x, y, dx: -1, dy: 1, color: color, length: length, fields: fields)// Diagonal left
    }
    
    private func hasChainAt(_ startX: Int, _ startY: Int, dx: Int, dy: Int, color: PieceColor, length: Int, fields: [[FieldModel]]) -> Bool {
        var x = startX
        var y = startY
        for _ in 0..<length {
            let field = fields.safeGet(y)?.safeGet(x)
            let empty = field?.isEmpty ?? false
            let doesNotMatchColor = field?.piece.value != color
            if empty || doesNotMatchColor {
                return false
            }
            x += dx
            y += dy
        }
        return true
    }
}
