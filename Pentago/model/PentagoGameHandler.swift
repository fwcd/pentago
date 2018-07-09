//
//  PentagoGameHandler.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

protocol PentagoGameHandler {
    func whatToPlace(at fieldPos: FieldPos, previousPiece: PieceModel?) -> PieceModel?
    
    func afterPlace(at fieldPos: FieldPos)
}
