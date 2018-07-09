//
//  QuadrantView.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation
import SpriteKit

class QuadrantView: ViewComponent {
    let totalPaddingDenom = 3
    let bgColor = NSColor(calibratedRed: 0.956, green: 0.701, blue: 0.258, alpha: 1.0)
    var node: SKNode
    
    init(model: QuadrantModel, bounds: CGRect) {
        let shapeNode = SKShapeNode(rect: bounds)
        shapeNode.fillColor = bgColor
        shapeNode.strokeColor = .clear
        node = shapeNode
        
        let minX = Int(bounds.minX)
        let minY = Int(bounds.minY)
        
        model.rotateClockwiseListener = {
            let rotateAngle = -CGFloat(Double.pi / 2)
            let rotateDuration = 1.0
            shapeNode.run(SKAction.sequence([
                SKAction.rotate(byAngle: -rotateAngle, duration: 0),
                SKAction.rotate(byAngle: rotateAngle, duration: rotateDuration)
            ]))
        }
        
        model.fields.addAndFireListener { fields in
            shapeNode.removeAllChildren()
            
            let yFields = fields.count
            let xFields = fields.first?.count ?? 0
            
            let totalXPadding = Int(bounds.width) / self.totalPaddingDenom
            let totalYPadding = Int(bounds.height) / self.totalPaddingDenom
            let fieldXPadding = totalXPadding / xFields
            let fieldYPadding = totalYPadding / yFields
            let fieldWidth = (Int(bounds.width) - totalXPadding) / xFields
            let fieldHeight = (Int(bounds.height) - totalYPadding) / yFields
            
            fields.compactMapWithIndex { row, y in
                row.mapWithIndex { field, x in
                    let fieldBounds = CGRect(
                        x: minX + (x * fieldWidth) + (x * fieldXPadding + (fieldXPadding / 2)),
                        y: minY + (y * fieldHeight) + (y * fieldYPadding + (fieldYPadding / 2)),
                        width: fieldWidth,
                        height: fieldHeight
                    )
                    return FieldView(model: field, bounds: fieldBounds).node
                }
            }.forEach { childNode in
                shapeNode.addChild(childNode)
            }
        }
    }
}
