//
//  ThreadsTableViewController.swift
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class ThreadsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mailbox"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Compose, target: self, action: "composeSelected")
        
        self.tableView.backgroundColor = UIColor(white: 51/255.0, alpha: 1)
        self.tableView.separatorColor = UIColor(white: 71/255.0, alpha: 1)
        
        tableView.registerClass(ThreadTableViewCell.classForCoder(), forCellReuseIdentifier: "ThreadTableViewCell")
        
        self.clearsSelectionOnViewWillAppear = true
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return 100
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ThreadTableViewCell", forIndexPath: indexPath) as ThreadTableViewCell
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        
        return 44.0
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let controller = MailViewController()
        self.navigationController.pushViewController(controller, animated: true)
    }
    
    func composeSelected() {
        
        let controller = ComposeEmailViewController()
        let navigationController = NavigationController(rootViewController: controller)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    
}
