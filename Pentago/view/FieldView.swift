//
//  FieldView.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation
import SpriteKit

class FieldView: ViewComponent {
    var node: SKNode
    let model: FieldModel
    let strokeColor = NSColor.black
    
    init(model: FieldModel, center: CGPoint, size: CGSize) {
        self.model = model
        
        let shapeNode = InteractableSKShapeNode(ellipseOf: size)
        node = shapeNode
        shapeNode.position = center
        shapeNode.strokeColor = strokeColor
        shapeNode.isUserInteractionEnabled = true
        shapeNode.mouseDownHandler = { _ in
            if let piece = model.gameHandler.whatToPlace(at: model.pos, previousPiece: model.piece.value) {
                model.piece.value = piece
                model.gameHandler.afterPlace(at: model.pos)
            }
        }
        
        model.piece.addAndFireListener { optionalPiece in
            if let piece = optionalPiece {
                shapeNode.removeAllChildren()
                shapeNode.addChild(PieceView(model: piece, size: size).node)
            }
        }
    }
}
