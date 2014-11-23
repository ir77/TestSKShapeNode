//
//  GameScene.swift
//  TestSKShapeNode
//
//  Created by ucuc on 11/23/14.
//  Copyright (c) 2014 ucuc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        makeSKShapeNode()
    }
    
    func makeSKShapeNode(){
        let tmpRect = CGRectMake(0.0, 0.0, 400, 100)
        let path = CGPathCreateWithRoundedRect(tmpRect, 9, 9 , nil)
        
        let blackRect = SKShapeNode()
        blackRect.path = path
        
        blackRect.fillColor = SKColor.blackColor()
        blackRect.position = CGPoint(x: self.frame.width/2-blackRect.frame.width/2, y: self.frame.height/2)
        self.addChild(blackRect)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let newScene = NextScene(size: self.size)
        //cleanUpChildrenAndRemove(self)
        self.view?.presentScene(newScene)
    }
    
    func cleanUpChildrenAndRemove(node:SKNode) {
        for child in node.children {
            cleanUpChildrenAndRemove(child as SKNode)
        }
        node.removeFromParent()
    }
}
