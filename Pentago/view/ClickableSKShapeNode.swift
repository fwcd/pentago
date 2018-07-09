//
//  ClickableSKShapeNode.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation
import SpriteKit

class ClickableSKShapeNode: SKShapeNode {
    var mouseDownHandler: ((NSEvent) -> Void)? = nil
    
    override func mouseDown(with event: NSEvent) {
        mouseDownHandler?(event)
    }
}
