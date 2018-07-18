//
//  InteractableSKShapeNode.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation
import SpriteKit

class InteractableSKShapeNode: SKShapeNode {
    var mouseDownHandler: ((NSEvent) -> Void)? = nil
    var mouseEnterHandler: ((NSEvent) -> Void)? = nil
    var mouseExitHandler: ((NSEvent) -> Void)? = nil
    
    override func mouseDown(with event: NSEvent) {
        mouseDownHandler?(event)
    }
    
    override func mouseEntered(with event: NSEvent) {
        mouseEnterHandler?(event)
    }
    
    override func mouseExited(with event: NSEvent) {
        mouseExitHandler?(event)
    }
}
