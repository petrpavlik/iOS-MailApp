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
        
        let signInButton = GoogleLoginWrapperView(frame: CGRect(x: 10, y: 300, width: 300, height: 44))
        self.view.addSubview(signInButton)

        
        
        let button = UIButton.buttonWithType(.System) as UIButton
        button.setTitle("Display Threads", forState: .Normal)
        button.frame = CGRectMake(10, 100, 300, 44)
        self.view.addSubview(button)
        
        button.addTarget(self, action: "buttonTapped", forControlEvents: .TouchUpInside)
    }
    
    
    func buttonTapped() {
        
        println("button tapped")
        
        //UIApplication.sharedApplication().openURL(NSURL(string: "https://accounts.google.com/o/oauth2/auth?redirect_uri=me.petrpavlik.MailApp:/oauth2Callback&response_type=code&client_id=442703748995-884gh0tnkjkm0508hriha8f7o8r1ipqr.apps.googleusercontent.com&approval_prompt=force&access_type=offline&scope=https://mail.google.com/"))
        
        //return
        
        let controller = ThreadsTableViewController(style: .Plain)
        
        let navigationController = NavigationController(rootViewController: controller)
        
        presentViewController(navigationController, animated: true, completion: nil)
    }


}

