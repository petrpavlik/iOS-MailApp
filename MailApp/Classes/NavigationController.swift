//
//  NavigationController.swift
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        //self.navigationBar.backgroundColor = UIColor(white: 77/255.0, alpha: 1)
        self.navigationBar.barTintColor = UIColor(white: 77/255.0, alpha: 1)
        self.navigationBar.translucent = false
        self.navigationBar.barStyle = .Black;
        
        //[UIColor colorWithRed:0.341 green:0.671 blue:1.000 alpha:1]
        self.view.tintColor = UIColor(red: 0.341, green: 0.671, blue: 1.000, alpha: 1)
    }
}
