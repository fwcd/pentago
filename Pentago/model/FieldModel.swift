//
//  FieldModel.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class FieldModel {
    var piece = Observable<PieceColor?>(nil)
    let gameHandler: PentagoGameHandler
    let pos: FieldPos
    
    var isEmpty: Bool { return piece.value == nil }
    
    init(handler: PentagoGameHandler, pos: FieldPos) {
        gameHandler = handler
        self.pos = pos
    }
}
