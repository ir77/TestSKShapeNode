//
//  NextScene.swift
//  TestSKShapeNode
//
//  Created by ucuc on 11/23/14.
//  Copyright (c) 2014 ucuc. All rights reserved.
//

import SpriteKit

class NextScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        makeLabel("hogehoge", fontSize: 35, yPosition: 100)
        makeLabel("hogehoge", fontSize: 35, yPosition: 250)
        makeLabel("hogehoge", fontSize: 35, yPosition: 400)
        makeLabel("hogehoge", fontSize: 35, yPosition: 550)
        makeLabel("hogehoge", fontSize: 35, yPosition: 700)
        makeLabel("hogehoge", fontSize: 35, yPosition: 100)
        makeLabel("hogehoge", fontSize: 35, yPosition: 250)
        makeLabel("hogehoge", fontSize: 35, yPosition: 400)
        makeLabel("hogehoge", fontSize: 35, yPosition: 550)
        makeLabel("hogehoge", fontSize: 35, yPosition: 700)

    }
    
    func makeLabel(labelText:String,fontSize: CGFloat, yPosition:CGFloat){
        let dqLabel = SKLabelNode(fontNamed: "PixelMplus12-Regular")
        dqLabel.text = labelText
        dqLabel.fontSize = fontSize
        
        let tmpRect = CGRectMake(0.0, 0.0, 400, 100)
        let blackRect = SKShapeNode()
        let path = CGPathCreateWithRoundedRect(tmpRect, 9, 9 , nil)

        blackRect.path = path
        blackRect.fillColor = SKColor.blackColor()
        blackRect.strokeColor = SKColor.whiteColor()
        dqLabel.position = CGPointMake(blackRect.frame.width/2, dqLabel.frame.size.height*1/3)
        blackRect.position = CGPoint(x: self.frame.width/2-blackRect.frame.width/2, y: yPosition)
        blackRect.addChild(dqLabel)
        self.addChild(blackRect)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let newScene = GameScene(size: self.size)
        //cleanUpChildrenAndRemove(self) //god bless this method
        self.view?.presentScene(newScene)
    }
    
    func cleanUpChildrenAndRemove(node:SKNode) {
        for child in node.children {
            cleanUpChildrenAndRemove(child as SKNode)
        }
        node.removeFromParent()
    }
}
