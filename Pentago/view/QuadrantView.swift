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
    
    init(model: QuadrantModel, center: CGPoint, size: CGSize) {
        let shapeNode = SKShapeNode(rectOf: size)
        shapeNode.fillColor = bgColor
        shapeNode.strokeColor = .clear
        shapeNode.position = center
        node = shapeNode
        
        model.rotateCounterClockwiseListener = {
            let rotateAngle = CGFloat(Double.pi / 2)
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
            
            let totalXPadding = Int(size.width) / self.totalPaddingDenom
            let totalYPadding = Int(size.height) / self.totalPaddingDenom
            let fieldXPadding = totalXPadding / xFields
            let fieldYPadding = totalYPadding / yFields
            let fieldWidth = (Int(size.width) - totalXPadding) / xFields
            let fieldHeight = (Int(size.height) - totalYPadding) / yFields
            let fieldSize = CGSize(width: fieldWidth, height: fieldHeight)
            
            let minX = -(Int(size.width) / 2) + (fieldWidth / 2)
            let minY = -(Int(size.height) / 2) + (fieldHeight / 2)
            
            fields.compactMapWithIndex { row, y in
                row.mapWithIndex { field, x in
                    let fieldCenter = CGPoint(
                        x: minX + (x * fieldWidth) + (x * fieldXPadding + (fieldXPadding / 2)),
                        y: minY + (y * fieldHeight) + (y * fieldYPadding + (fieldYPadding / 2))
                    )
                    return FieldView(model: field, center: fieldCenter, size: fieldSize).node
                }
            }.forEach { childNode in
                shapeNode.addChild(childNode)
            }
        }
    }
}
