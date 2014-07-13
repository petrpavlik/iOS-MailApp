//
//  ViewController.swift
//  MailApp
//
//  Created by Petr Pavlik on 09/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    //AuthManager.sharedInstance().configureWithClientId("442703748995-884gh0tnkjkm0508hriha8f7o8r1ipqr.apps.googleusercontent.com")
        
        self.view.backgroundColor = UIColor(white: 51/255.0, alpha: 1)
        self.view.tintColor = UIColor(red: 0.341, green: 0.671, blue: 1.000, alpha: 1)
        
        let button = UIButton.buttonWithType(.System) as UIButton
        button.setTitle("Sign In", forState: .Normal)
        button.frame = CGRectMake(10, 100, 300, 44)
        button.center = CGPointMake(view.center.x, view.center.y*0.9)
        button.titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        self.view.addSubview(button)
        
        button.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
    }
    
    
    func buttonTapped() {
        
        println("button tapped")
        
        /*AuthManager.sharedInstance().signInWithCompletionHandler(completionHandler: ((GmailAccessTokenEntity!, NSError!) -> Void)? {
            
            
            })*/
        
        return
        
        let controller = ThreadsTableViewController(style: .Plain)
        
        let navigationController = NavigationController(rootViewController: controller)
        navigationController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        presentViewController(navigationController, animated: true, completion: nil)
        
    }


    override func preferredStatusBarStyle() -> UIStatusBarStyle  {
        return UIStatusBarStyle.LightContent
    }
}

