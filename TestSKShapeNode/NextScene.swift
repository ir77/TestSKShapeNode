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
        makeLabel("hogehoge", yPosition: 100)
        makeLabel("hogehoge", yPosition: 250)
        makeLabel("hogehoge", yPosition: 400)
        makeLabel("hogehoge", yPosition: 550)
        makeLabel("hogehoge", yPosition: 700)
        makeLabel("hogehoge", yPosition: 100)
        makeLabel("hogehoge", yPosition: 250)
        makeLabel("hogehoge", yPosition: 400)
        makeLabel("hogehoge", yPosition: 550)
        makeLabel("hogehoge", yPosition: 700)
    }
    
    func makeLabel(labelText:String, yPosition:CGFloat){
        let myLabel = SKLabelNode(fontNamed: "PixelMplus12-Regular")
        myLabel.text = labelText
        myLabel.fontSize = 35
        
        let tmpRect = CGRectMake(0.0, 0.0, 400, 100)
        let blackRect = SKShapeNode()
        let path = CGPathCreateWithRoundedRect(tmpRect, 9, 9 , nil)

        blackRect.path = path
        blackRect.fillColor = SKColor.blackColor()
        blackRect.strokeColor = SKColor.whiteColor()
        myLabel.position = CGPointMake(blackRect.frame.width/2, myLabel.frame.size.height*1/3)
        blackRect.position = CGPoint(x: self.frame.width/2-blackRect.frame.width/2, y: yPosition)
        blackRect.addChild(myLabel)
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
