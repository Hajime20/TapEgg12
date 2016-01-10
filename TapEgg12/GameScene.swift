//
//  GameScene.swift
//  TapEgg12
//
//  Created by HajimeH on 2015/04/30.
//   for Xcode7.2   Target iOS 8.1  on 12/21
//
//  Copyright (c) 2015年 HajimeH. All rights reserved.

import SpriteKit

class GameScene: SKScene {
    
    // タップ
    var tapSum = 0
    
    // タップと、タップ表示用ラベルを用意
    //Left
    var tapL:NSInteger = 0
    let tapCountL = SKLabelNode(fontNamed: "Hiragino Kaku Gothic ProN")
    //Mid
    var tapM:NSInteger = 0
    let tapCountM = SKLabelNode(fontNamed: "Hiragino Kaku Gothic ProN")
    //Right
    var tapR:NSInteger = 0
    let tapCountR = SKLabelNode(fontNamed: "Hiragino Kaku Gothic ProN")
    
    //イラスト用スプライト
    let eggTSprite = SKSpriteNode(imageNamed: "eggT.png")
    let eggBSprite = SKSpriteNode(imageNamed: "eggB.png")
    let eggISprite = SKSpriteNode(imageNamed: "EggIn.png")
    let eggFSprite = SKSpriteNode(imageNamed: "eggF.png")
    
    //********
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        //背景色
        backgroundColor = SKColor(red: 0.655, green: 0.925, blue: 0.624, alpha: 1.0)
        
        
        //タップ回数を表示する
        //Left
        tapCountL.text = "ひだり"
        tapCountL.fontSize = 37
        tapCountL.horizontalAlignmentMode = .Left
        tapCountL.fontColor = SKColor.blackColor()
        tapCountL.position = CGPoint(x:CGRectGetMidX(self.frame) - 140, y:CGRectGetMidY(self.frame)*1.7)
        self.addChild(tapCountL)
        //Mid
        tapCountM.text = "なか"
        tapCountM.fontSize = 37
        tapCountM.horizontalAlignmentMode = .Left
        tapCountM.fontColor = SKColor.blackColor()
        tapCountM.position = CGPoint(x:CGRectGetMidX(self.frame) - 20,
            y:CGRectGetMidY(self.frame)*1.7)
        self.addChild(tapCountM)
        //Right
        tapCountR.text = "みぎ"
        tapCountR.fontSize = 37
        tapCountR.horizontalAlignmentMode = .Left
        tapCountR.fontColor = SKColor.blackColor()
        tapCountR.position = CGPoint(x:CGRectGetMidX(self.frame) + 95,
            y:CGRectGetMidY(self.frame)*1.7)
        self.addChild(tapCountR)
        
        // egg
        eggISprite.position = CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame))
        eggISprite.size = CGSize(width: eggISprite.size.width,
            height: eggISprite.size.height)
        
        
        eggTSprite.position = CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame))
        eggTSprite.size = CGSize(width: eggTSprite.size.width,
            height: eggTSprite.size.height)
        
        eggBSprite.position = CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame))
        eggBSprite.size = CGSize(width: eggBSprite.size.width,
            height: eggBSprite.size.height)
        eggBSprite.position = CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame))
        
        
        eggFSprite.size = CGSize(width: eggFSprite.size.width,
            height: eggFSprite.size.height)
        eggFSprite.position = CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame))
        
        //zPosition
        eggISprite.zPosition = 1
        eggTSprite.zPosition = 2
        eggBSprite.zPosition = 2
        eggFSprite.zPosition = 3
        
        self.addChild(eggISprite)
        self.addChild(eggTSprite)
        self.addChild(eggBSprite)
        self.addChild(eggFSprite)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        for touch: AnyObject in touches {
            //タッチした位置を得る
            let location = touch.locationInNode(self)
            
            //ダメージをアップして、表示する
            if location.x < CGRectGetMidX(self.frame) - 50 {
                tapL += 1
            } else if location.x  > CGRectGetMidX(self.frame) + 50{
                tapR += 1
            } else {
                tapM += 1
            }
            // 5以上の制限
            if tapL > 12 {
                tapL = 12
            }
            if tapM > 12 {
                tapM = 12
            }
            
            if tapR > 12 {
                tapR = 12
            }
            tapCountL.text = "\(tapL)"
            tapCountR.text = "\(tapR)"
            tapCountM.text = "\(tapM)"
            
            tapSum = tapL + tapM + tapR
            if (tapSum == 1){
                tapSum1()
            }
            if (tapSum == 34){
                tapSum34()
            }
            if (tapSum == 35){
                tapSum35()
            }
            if (tapSum == 36){
                tapSum36()
            }
        }
        
    }
    
    
    //タップ合計 1
    func tapSum1(){
        
        // たまごをフェードアウトさせるアクション
        let action1 = SKAction.fadeOutWithDuration(12)
        eggFSprite.runAction(action1)
    }
    
    
    //タップ合計 34
    func tapSum34(){
        
        // たまごを少し右に傾けるアクション
        let action1 = SKAction.rotateToAngle(-0.1, duration: 0.1)
        // たまごを少し左に傾けるアクション
        let action2 = SKAction.rotateToAngle( 0.2, duration: 0.1)
        // たまごを垂直に
        let action3 = SKAction.rotateToAngle( 0, duration: 0.4)
        
        let actionS = SKAction.sequence(
            [action1, action2, action3])
        
        //たまご上と下にアクション
        eggTSprite.runAction(actionS)
        eggBSprite.runAction(actionS)
    }
    
    //タップ合計 35
    func tapSum35(){
        
        let action1 = SKAction.moveTo(CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame)  + 7), duration: 0.1)
        let action2 = SKAction.moveTo(CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame)  + 17), duration: 0.2)
        let actionS1 = SKAction.sequence(
            [action1, action2])
        
        let action3 = SKAction.rotateToAngle(-0.2, duration: 0.2)
        let action4 = SKAction.rotateToAngle( 0.2, duration: 0.4)
        
        let actionS2 = SKAction.sequence(
            [action3, action4, action3])
        
        eggTSprite.runAction(actionS1)
        eggTSprite.runAction(actionS2)
    }
    
    //タップ 36
    func tapSum36(){
        
        let action1 = SKAction.moveTo(CGPoint(x: CGRectGetMidX(self.frame),
            y: CGRectGetMidY(self.frame)*1.2), duration: 0.2)
        let action2 = SKAction.removeFromParent()
        
        let actionS1 = SKAction.sequence(
            [action1, action2])
        
        eggTSprite.runAction(actionS1, completion:endTap)
        
    }
    
    func endTap(){
        
        //
        let nextScene = SecondScene(size: self.size)
        nextScene.scaleMode = scaleMode
        
        //self.view?.presentScene(nextScene, transition:transition)
        self.view?.presentScene(nextScene)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
