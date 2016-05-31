//
//  MainMenuViewController.swift
//  PlatformGame
//
//  Created by Rafael Valer on 5/31/16.
//  Copyright © 2016 2D Game World. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var lblGameIntro: UILabel!
    @IBOutlet weak var btnStartGame: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionStartBtnPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("segueStartNewGame", sender: nil)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let segueId = segue.identifier where segueId == "segueStartNewGame"{
            let destinationVC = segue.destinationViewController as! GameViewController
            destinationVC.menuViewController = self
        }
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
