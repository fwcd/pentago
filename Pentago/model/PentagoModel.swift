//
//  PentagoModel.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class PentagoModel: PentagoGameHandler {
    var board: BoardModel! = nil
    var blackPlayerTurn = true
    var gameOverListener: ((PieceColor?) -> Void)?
    
    init() {
        board = BoardModel(handler: self)
    }
    
    func whatToPlace(at fieldPos: FieldPos, previousPiece: PieceColor?) -> PieceColor? {
        if previousPiece != nil {
            return nil
        } else {
            let moveByBlackPlayer = blackPlayerTurn
            blackPlayerTurn = !blackPlayerTurn
            return moveByBlackPlayer ? PieceColor.black : PieceColor.white
        }
    }
    
    func afterPlace(at fieldPos: FieldPos) {
        board.quadrants.value[fieldPos.quadrantY][fieldPos.quadrantX].rotate()
        
        if board.isFull {
            gameOver()
        }
    }
    
    func gameOver() {
        gameOverListener?(nil)
    }
    
    func win(_ color: PieceColor) {
        gameOverListener?(color)
    }
}
