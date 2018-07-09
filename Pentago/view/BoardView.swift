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
    
    init(model: BoardModel, center: CGPoint, size: CGSize) {
        let shapeNode = SKShapeNode(rectOf: size)
        shapeNode.fillColor = bgColor
        shapeNode.strokeColor = .clear
        shapeNode.position = center
        node = shapeNode
        
        model.quadrants.addAndFireListener { quadrants in
            shapeNode.removeAllChildren()
            
            let yQuadrants = quadrants.count
            let xQuadrants = quadrants.first?.count ?? 0
            
            let totalXPadding = Int(size.width) / self.totalPaddingDenom
            let totalYPadding = Int(size.height) / self.totalPaddingDenom
            let quadrantXPadding = totalXPadding / xQuadrants
            let quadrantYPadding = totalYPadding / yQuadrants
            let quadrantWidth = (Int(size.width) - totalXPadding) / xQuadrants
            let quadrantHeight = (Int(size.height) - totalYPadding) / yQuadrants
            let quadrantSize = CGSize(width: quadrantWidth, height: quadrantHeight)
            
            let minX = Int(center.x) - (Int(size.width) / 2) + (quadrantWidth / 2)
            let minY = Int(center.y) - (Int(size.height) / 2) + (quadrantHeight / 2)
            
            quadrants.compactMapWithIndex { row, y in
                row.mapWithIndex { quadrant, x in
                    /*let quadrantBounds = CGRect(
                        x: minX + (x * quadrantWidth) + (x * quadrantXPadding + (quadrantXPadding / 2)),
                        y: minY + (y * quadrantHeight) + (y * quadrantYPadding + (quadrantYPadding / 2)),
                        width: quadrantWidth,
                        height: quadrantHeight
                    )*/
                    let quadrantPos = CGPoint(
                        x: minX + (x * quadrantWidth) + (x * quadrantXPadding + (quadrantXPadding / 2)),
                        y: minY + (y * quadrantHeight) + (y * quadrantYPadding + (quadrantYPadding / 2))
                    )
                    return QuadrantView(model: quadrant, center: quadrantPos, size: quadrantSize).node
                }
            }.forEach { childNode in
                shapeNode.addChild(childNode)
            }
        }
    }
}
