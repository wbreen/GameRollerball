//
//  GameViewController.swift
//  Rollerball
//
//  Created by William Breen on 11/7/16.
//  Copyright © 2016 William Breen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView        //skview has own properties, so casting to it allows you to use them
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }

    
}
