//
//  AppViewController.swift
//  Pentago
//
//  Created by Fredrik on 7/8/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class AppViewController: NSViewController {
    @IBOutlet var skView: SKView!
    let pentagoModel = PentagoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content including entities and graphs.
        if let scene = GKScene(fileNamed: "GameScene") {
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.skView {
                    // Configure and add game board view
                    let boundLength: CGFloat = skView.frame.height
                    let center = CGPoint(x: 0, y: 0)
                    let size = CGSize(width: boundLength, height: boundLength)
                    sceneNode.addChild(PentagoView(model: pentagoModel, center: center, size: size).node)
                    
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }
}

