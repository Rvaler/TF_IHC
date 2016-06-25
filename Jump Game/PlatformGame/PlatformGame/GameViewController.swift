//
//  GameViewController.swift
//  PlatformGame
//
//  Created by Rafael Valer on 5/31/16.
//  Copyright © 2016 2D Game World. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController, GameOverDelegate {
    
    @IBOutlet var gameSkView: SKView!
    var gameOverViewController: GameOverViewController!
    var menuViewController: MainMenuViewController!
    
    var gameScene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()      
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            gameScene = scene
            
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            //SHOW THE PHSYICS BORDERS
            //skView.showsPhysics = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = false
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            gameScene.viewController = self
            skView.presentScene(scene)
        }
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return UIInterfaceOrientationMask.AllButUpsideDown
        } else {
            return UIInterfaceOrientationMask.All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillDisappear(animated: Bool) {
        gameScene.removeFromParent()
        gameSkView.scene?.removeAllActions()
        gameSkView.scene?.removeAllChildren()
        gameSkView.scene?.removeFromParent()
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueGameOver" {
            if let score = sender as? Int, vc = segue.destinationViewController as? GameOverViewController {
                gameOverViewController = vc
                gameOverViewController.delegate = self
                gameOverViewController.score = score
            }
        }
    }
    
    func gameOverViewController(gameOverViewController: GameOverViewController, didTapPlayAgainButton button: UIButton) {
        
        viewDidLoad()
    }
}
