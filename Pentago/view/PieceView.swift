//
//  PieceView.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation
import SpriteKit

class PieceView: ViewComponent {
    var node: SKNode
    
    init(model: PieceModel, size: CGSize) {
        let shapeNode = SKShapeNode(ellipseOf: size)
        shapeNode.strokeColor = .clear
        
        switch model {
        case .black:
            shapeNode.fillColor = .black
        case .white:
            shapeNode.fillColor = .white
        }
        
        node = shapeNode
    }
}
