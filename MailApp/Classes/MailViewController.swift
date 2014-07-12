//
//  MailViewController.swift
//  MailApp
//
//  Created by Petr Pavlik on 11/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit
import WebKit

class MailViewController: UIViewController, UIScrollViewDelegate {
    
    @lazy var webView : WKWebView = {
        
        let webView = WKWebView()
        
        webView.setTranslatesAutoresizingMaskIntoConstraints(false)
        //tableView.backgroundColor = UIColor.greenColor()
        
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.webView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Reply, target: self, action: "replySelected")
        
        
        webView.scrollView.delegate = self //this is sooo wrong, but it does not seem to affect the scrollview in any way
        
        webView.scrollView.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
        
        
        let viewBindingsDict = NSMutableDictionary()
        viewBindingsDict.setValue(webView, forKey: "webView")
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[webView]|", options: nil, metrics: nil, views: viewBindingsDict))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[webView]|", options: nil, metrics: nil, views: viewBindingsDict))
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://iosdevweekly.com/issues/153")))
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        if scrollView.contentOffset.y <= 0 && scrollView.contentOffset.y >= -88 {
            
            webView.scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        }
        else {
            
            if scrollView.contentOffset.y >= 0 {
                webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
            else {
                webView.scrollView.contentInset = UIEdgeInsets(top: 88, left: 0, bottom: 0, right: 0)
            }
        }
    }
    
    deinit {
        
        webView.scrollView.delegate = nil //hack: prevents a crash
    }
}

