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
    let selectable: ReadOnlyObservable<Bool>
    
    var isEmpty: Bool { return piece.value == nil }
    
    init(handler: PentagoGameHandler, pos: FieldPos) {
        gameHandler = handler
        selectable = handler.selectableFields
        self.pos = pos
    }
}
