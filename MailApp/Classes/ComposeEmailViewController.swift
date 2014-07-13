//
//  ComposeEmailViewController.swift
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class ComposeEmailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @lazy var headerTableView : UITableView = {
        
        let tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        
        tableView.setTranslatesAutoresizingMaskIntoConstraints(false)
        //tableView.backgroundColor = UIColor.greenColor()
        tableView.separatorColor = UIColor(white: 71/255.0, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.scrollEnabled = false
        
        tableView.registerClass(InputTableViewCell.classForCoder(), forCellReuseIdentifier: "InputTableViewCell")
        
        return tableView
        }()
    
    @lazy var textView : UITextView = {
        
        let textView = UITextView()
        
        textView.setTranslatesAutoresizingMaskIntoConstraints(false)
        textView.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        textView.backgroundColor = UIColor(white: 51/255.0, alpha: 1)
        textView.textColor = UIColor.whiteColor()
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "New Email"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: UIBarButtonItemStyle.Done, target: self, action: "sendSelected")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Bordered, target: self, action: "cancelSelected")
        
        
        self.view.addSubview(textView)
        
        textView.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
        
        textView.addSubview(headerTableView)
        
        
        let viewBindingsDict = NSMutableDictionary()
        viewBindingsDict.setValue(textView, forKey: "textView")
        viewBindingsDict.setValue(headerTableView, forKey: "headerTableView")

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[textView]|", options: nil, metrics: nil, views: viewBindingsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[textView]|", options: nil, metrics: nil, views: viewBindingsDict))
        
        
        textView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[headerTableView(320)]", options: nil, metrics: nil, views: viewBindingsDict))
        textView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[headerTableView(88)]", options: nil, metrics: nil, views: viewBindingsDict))
        
        textView.addConstraint(NSLayoutConstraint(item: headerTableView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: textView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: -88))
        
        //let toCell = headerTableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as InputTableViewCell
        //toCell.valueTextField.becomeFirstResponder()
        
    }
    
    func sendSelected() {
        
        textView.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func cancelSelected() {
        
        textView.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("InputTableViewCell", forIndexPath: indexPath) as InputTableViewCell
        
        if indexPath.row == 0 {
            cell.titleLabel.text = "To:"
        }
        else {
            cell.titleLabel.text = "Subject:"
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        
        return 44.0
    }
}
