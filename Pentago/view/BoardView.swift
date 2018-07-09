//
//  BoardView.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation
import SpriteKit

class BoardView: ViewComponent {
    let totalPaddingDenom = 8
    let bgColor = NSColor.darkGray
    var node: SKNode
    
    init(model: BoardModel, bounds: CGRect) {
        let shapeNode = SKShapeNode(rect: bounds)
        shapeNode.fillColor = bgColor
        shapeNode.strokeColor = .clear
        node = shapeNode
        
        let minX = Int(bounds.minX)
        let minY = Int(bounds.minY)
        
        model.quadrants.addAndFireListener { quadrants in
            shapeNode.removeAllChildren()
            
            let yQuadrants = quadrants.count
            let xQuadrants = quadrants.first?.count ?? 0
            
            let totalXPadding = Int(bounds.width) / self.totalPaddingDenom
            let totalYPadding = Int(bounds.height) / self.totalPaddingDenom
            let quadrantXPadding = totalXPadding / xQuadrants
            let quadrantYPadding = totalYPadding / yQuadrants
            let quadrantWidth = (Int(bounds.width) - totalXPadding) / xQuadrants
            let quadrantHeight = (Int(bounds.height) - totalYPadding) / yQuadrants
            
            quadrants.compactMapWithIndex { row, y in
                row.mapWithIndex { quadrant, x in
                    let quadrantBounds = CGRect(
                        x: minX + (x * quadrantWidth) + (x * quadrantXPadding + (quadrantXPadding / 2)),
                        y: minY + (y * quadrantHeight) + (y * quadrantYPadding + (quadrantYPadding / 2)),
                        width: quadrantWidth,
                        height: quadrantHeight
                    )
                    return QuadrantView(model: quadrant, bounds: quadrantBounds).node
                }
            }.forEach { childNode in
                shapeNode.addChild(childNode)
            }
        }
    }
}
