//
//  InputTableViewCell.swift
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell {
    
    //public stuff
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!)  {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    @lazy var titleLabel : UILabel = {
        
        var label = UILabel()
        
        label.numberOfLines = 1;
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        label.textColor = UIColor(white: 204/255.0, alpha: 1)
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.text = "aaa"
        label.textColor = UIColor(white: 204/255.0, alpha: 1)
        
        return label
    }()
    
    @lazy var valueTextField : UITextField = {
        
        var textField = UITextField()
        
        textField.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        textField.setTranslatesAutoresizingMaskIntoConstraints(false)
        textField.textColor = UIColor.whiteColor()
        
        return textField
    }()
    
    // private stuff
    
    func configure() {
        
        self.selectionStyle = .None
        
        self.backgroundColor = UIColor(white: 51/255.0, alpha: 1)
        
        let contentView = self.contentView
        
        contentView.addSubview(self.titleLabel)
        contentView.addSubview(self.valueTextField)
        
        titleLabel.setContentHuggingPriority(1000, forAxis: UILayoutConstraintAxis.Horizontal)
        
        let viewBindingsDict = NSMutableDictionary()
        viewBindingsDict.setValue(titleLabel, forKey: "titleLabel")
        viewBindingsDict.setValue(valueTextField, forKey: "valueTextField")

        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[titleLabel]-[valueTextField]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: viewBindingsDict))
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[titleLabel(>=44)]|", options: nil, metrics: nil, views: viewBindingsDict))
    }
    
    override func setSelected(selected: Bool, animated: Bool)  {
        super.setSelected(selected, animated: animated)
        
        if selected {
            valueTextField.becomeFirstResponder()
        }
    }
}
