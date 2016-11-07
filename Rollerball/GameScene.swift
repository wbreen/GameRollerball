//
//  GameScene.swift
//  Rollerball
//
//  Created by William Breen on 11/7/16.
//  Copyright © 2016 William Breen. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    //going to create a "game" where tilting the phone moves a ball the 
    
    //once ball is made available: replace all instances of "zombie" with "ball"
    //let ball = SKSpriteNode(imageNamed: "Ball")
    let zombie = SKSpriteNode(imageNamed: "Zombie")
    let motionManager = CMMotionManager()
    
    //let ballSpeed: CGFloat = 15.0
    let zombieSpeed: CGFloat = 15.0
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        //ball.position = CGPoint( x: size.width * 0.1, y: size.height * 0.5)
        zombie.position = CGPoint( x: size.width * 0.1, y: size.height * 0.5)
        addChild(zombie)        //becomes ball in final project
        
        motionManager.startAccelerometerUpdates()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if let accelData = motionManager.accelerometerData {
            
            let newX = zombie.position.x - CGFloat(accelData.acceleration.y) * zombieSpeed      //switched x and y b/c they were reversed on the phone
            let newY = zombie.position.y + CGFloat(accelData.acceleration.x) * zombieSpeed
            
            zombie.position.x = newX
            zombie.position.y = newY
            
            let halfWidth = zombie.size.width / 2
            let halfHeight = zombie.size.height / 2
            
            if zombie.position.x < halfWidth {
                zombie.position.x = halfWidth
            } else if zombie.position.x + halfWidth > size.width {
                zombie.position.x = size.width - halfWidth
            }
            
            if zombie.position.y < halfHeight {
                zombie.position.y = halfHeight
            } else if zombie.position.y + halfHeight > size.height {
                zombie.position.y = size.width - halfHeight
            }
        }
        
    }
    
}
