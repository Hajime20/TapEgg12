//
//  SecondScene.swift
//  TapEgg12
//
//  Created by HajimeH on 2015/04/30.
//   for Xcode7.2   Target iOS 8.1  on 12/21
//
//  Copyright (c) 2015年 HajimeH. All rights reserved.

import Foundation
import SpriteKit

class SecondScene: SKScene{
    
    //イラスト用スプライト
    let bottonSprite = SKSpriteNode(imageNamed: "botton.png")
    
    
    override func didMoveToView(view: SKView) {
        
        //背景色
        backgroundColor = SKColor(red: 0.655, green: 0.925, blue: 0.624, alpha: 1.0)
        
        // eggFinish
        // 3   :0-2
        let index = Int(arc4random_uniform(10))
        //println("\(index)点")
        
        //let piopioSprite = SKSpriteNode(imageNamed: "\(index)")
        let piopioSprite = SKSpriteNode(imageNamed: "\(index)")
        
        //
        piopioSprite.size = CGSize(width: piopioSprite.size.width,
            height: piopioSprite.size.height)
        piopioSprite.position = CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame))
        piopioSprite.physicsBody?.dynamic = false   // 落下しないよう固定
        piopioSprite.zPosition = 1
        
        //self.egg = egg
        self.addChild(piopioSprite)
        //self.addChild(eggBSprite)
        
        //再スタートラベルRestart
        // ボタン
        bottonSprite.position = CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame) * 0.4)
        
        bottonSprite.size = CGSize(width: bottonSprite.size.width,
            height: bottonSprite.size.height)
        
        bottonSprite.zPosition = 10
        
        self.addChild(bottonSprite)
        
    }
    
    //
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches{
            let location = touch.locationInNode(self)
            // タッチした位置にあるものを調べる
            let touchNode = self.nodeAtPoint(location)
            
            if touchNode == bottonSprite {
                //最初のシーンに
                let firstScene = GameScene(size: self.size)
                firstScene.scaleMode = scaleMode
                
                //self.view?.presentScene(firstScene, transition: nil)
                self.view?.presentScene(firstScene)
            }
            //override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
            
        }
        
    }
    
}

