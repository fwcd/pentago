//
//  FieldModel.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

class FieldModel {
    var piece = Observable<PieceModel?>(nil)
    let gameHandler: PentagoGameHandler
    let pos: FieldPos
    
    init(handler: PentagoGameHandler, pos: FieldPos) {
        gameHandler = handler
        self.pos = pos
    }
}
