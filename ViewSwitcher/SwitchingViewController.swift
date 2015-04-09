//
//  SwitchingViewController.swift
//  ViewSwitcher
//
//  Created by Vivek Ramesh on 26/03/15.
//  Copyright (c) 2015 slidenerd. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {

    private var blueViewController: BlueViewController!
    private var yellowViewController:YellowViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        blueViewController = storyboard?.instantiateViewControllerWithIdentifier("Blue") as! BlueViewController
        blueViewController.view.frame=view.frame;
        println("View did load switching from nil to blue")
        switchViewController(from:nil, to:blueViewController);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        if blueViewController != nil && blueViewController!.view.superview == nil {
            println("time to make blue nil")
            blueViewController = nil;
        }
        if  yellowViewController != nil && yellowViewController!.view.superview != nil {
            println("time to make yellow nil")
            yellowViewController=nil;
        }
        // Dispose of any resources that can be recreated.
    }
    @IBAction func switchViews(sender: UIBarButtonItem){
        if yellowViewController?.view.superview==nil{
            if yellowViewController==nil{
                println("creating yellow")
                yellowViewController = storyboard?.instantiateViewControllerWithIdentifier("Yellow") as! YellowViewController;
                
            }
        }
        else if blueViewController?.view.superview==nil{
            if blueViewController==nil{
                println("creating blue")
                blueViewController=storyboard?.instantiateViewControllerWithIdentifier("Blue") as! BlueViewController;
                
            }
        }
        UIView.beginAnimations("View Flip", context: nil);
        UIView.setAnimationDuration(2);
        UIView.setAnimationCurve(.EaseInOut);
        if blueViewController != nil && blueViewController!.view.superview != nil
        {
            println("switching from blue to yellow")
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true);
            yellowViewController.view.frame=view.frame;
            switchViewController(from: blueViewController, to: yellowViewController);
        }
        else{
            println("switching from yellow to blue")
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true);
            blueViewController.view.frame=view.frame;
            switchViewController(from:yellowViewController, to:blueViewController);
        }
        UIView.commitAnimations();
        
        
    }

    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?){
        if fromVC != nil {
            println("fromVC! = nil from : \(toString(fromVC)) to : \(toString(toVC))")
            fromVC!.willMoveToParentViewController(nil);
            fromVC!.view.removeFromSuperview();
            fromVC!.removeFromParentViewController();
        }
        if toVC != nil{
            println("toVC!=nil from : \(toString(fromVC)) to : \(toString(toVC))")
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, atIndex: 0);
            toVC!.didMoveToParentViewController(self);
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
