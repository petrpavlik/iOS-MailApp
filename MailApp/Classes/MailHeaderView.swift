//
//  EmailHeaderView.swift
//  MailApp
//
//  Created by Petr Pavlik on 11/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class MailHeaderView: UIView {
    
    @lazy var subjectLabel : UILabel = {
        
        var label = UILabel()
        
        label.numberOfLines = 1;
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        label.textColor = UIColor.whiteColor()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.text = "aaa"
        label.textColor = UIColor.whiteColor()
        
        return label
    }()
    
    @lazy var fromLabel : UILabel = {
        
        var label = UILabel()
        
        label.numberOfLines = 1;
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        label.textColor = UIColor(white: 204/255.0, alpha: 1)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.text = "aaa"
        label.textColor = UIColor.whiteColor()
        
        return label
    }()
    
    func configure() {
        
        
    }
}
