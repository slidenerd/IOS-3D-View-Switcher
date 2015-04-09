//
//  YellowViewController.swift
//  ViewSwitcher
//
//  Created by Vivek Ramesh on 26/03/15.
//  Copyright (c) 2015 slidenerd. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func yellowButtonPressed (sender: UIButton) {
        let alert=UIAlertController(title: "Yellow Button Pressed", message: "you pressed the yellow button", preferredStyle: .Alert);
        let action = UIAlertAction(title: "Yep I did", style: .Default, handler: nil);
        alert.addAction(action);
        presentViewController(alert, animated: true, completion: nil);
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
