//
//  PentagoGameHandler.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

protocol PentagoGameHandler {
    var selectableFields: Observable<Bool> { get }
    var selectableQuadrants: Observable<Bool> { get }
    
    func whatToPlace(at fieldPos: FieldPos, previousPiece: PieceColor?) -> PieceColor?
    
    func afterPlace(at fieldPos: FieldPos)
}
