//
//  GameOverViewController.swift
//  PlatformGame
//
//  Created by Rafael Valer on 5/31/16.
//  Copyright © 2016 2D Game World. All rights reserved.
//

import UIKit

protocol GameOverDelegate {
    func gameOverViewController(gameOverViewController: GameOverViewController, didTapPlayAgainButton button: UIButton)
}

class GameOverViewController: UIViewController {
    
    var score: Int?
    var delegate: GameOverDelegate?
    @IBOutlet weak var lblScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score = score {
            self.lblScore.text = "Score: \(score)"
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionRestartBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        delegate?.gameOverViewController(self, didTapPlayAgainButton: sender as! UIButton)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
