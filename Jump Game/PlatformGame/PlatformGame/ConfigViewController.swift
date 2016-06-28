//
//  ConfigViewController.swift
//  PlatformGame
//
//  Created by Rafael Valer on 6/28/16.
//  Copyright © 2016 2D Game World. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gameType = defaults.objectForKey("gameType") as? Int {
            self.segmentedControl.selectedSegmentIndex = gameType
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionCancelBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) {
        }
    }
    @IBAction func segmentControlChanged(sender: AnyObject) {
        print(self.segmentedControl.selectedSegmentIndex)
        defaults.setObject(self.segmentedControl.selectedSegmentIndex, forKey: "gameType")
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
