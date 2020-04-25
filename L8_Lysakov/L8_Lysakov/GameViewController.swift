//
//  GameViewController.swift
//  L8_Lysakov
//
//  Created by Slava V. Lysakov on 12.04.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: view.bounds.size)
        if let view = self.view as! SKView? {
            view.showsFPS = true
            view.showsNodeCount = true
            view.ignoresSiblingOrder = true
            scene.scaleMode = .resizeFill
            view.presentScene(scene)
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        UIInterfaceOrientationMask.landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }


}
