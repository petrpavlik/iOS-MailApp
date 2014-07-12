//
//  ThreadTableViewCell.swift
//  MailApp
//
//  Created by Petr Pavlik on 10/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class ThreadTableViewCell: UITableViewCell {
    
    //public stuff
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!)  {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    
    // private stuff
    
    func configure() {
        
        self.backgroundColor = UIColor(white: 51/255.0, alpha: 1)
        
        let selectedBackgroundView = UIView(frame: CGRectZero)
        selectedBackgroundView.backgroundColor = UIColor(white: 92/255.0, alpha: 1)
        self.selectedBackgroundView = selectedBackgroundView
        
        let contentView = self.contentView
        
        let subjectLabel = UILabel()
        let bodyPreviewLabel = UILabel()
        let dateLabel = UILabel()
        let senderLabel = UILabel()
        let unreadIndicatorView = UnreadMailIndicatorView(frame: CGRectZero)
        
        senderLabel.numberOfLines = 1;
        senderLabel.text = "Dropbox Platform Team"
        senderLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        senderLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        //subjectLabel.backgroundColor = UIColor.greenColor()
        senderLabel.textColor = UIColor.whiteColor()
        contentView.addSubview(senderLabel)
        
        subjectLabel.numberOfLines = 1;
        subjectLabel.text = "Fresh News from Dropbox"
        subjectLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        subjectLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        //subjectLabel.backgroundColor = UIColor.greenColor()
        subjectLabel.textColor = UIColor.whiteColor()
        contentView.addSubview(subjectLabel)
        
        dateLabel.numberOfLines = 1;
        dateLabel.text = "yesterday"
        dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        dateLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        //dateLabel.backgroundColor = UIColor.greenColor()
        dateLabel.textColor = UIColor(white: 204/255.0, alpha: 1)
        contentView.addSubview(dateLabel)
        
        bodyPreviewLabel.numberOfLines = 2;
        bodyPreviewLabel.text = "Hi Petr, We just wanted to let you know what the Dropbox Developer Platform team has been up to lately."
        bodyPreviewLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        bodyPreviewLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        bodyPreviewLabel.textColor = UIColor(white: 204/255.0, alpha: 1)
        //bodyPreviewLabel.backgroundColor = UIColor.greenColor()
        //bodyPreviewLabel.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: UILayoutConstraintAxis.Vertical)
        //bodyPreviewLabel.setContentCompressionResistancePriority(1000, forAxis: UILayoutConstraintAxis.Vertical)
        contentView.addSubview(bodyPreviewLabel)
        
        
        unreadIndicatorView.setTranslatesAutoresizingMaskIntoConstraints(false)
        contentView.addSubview(unreadIndicatorView)
        
        
        let viewBindingsDict = NSMutableDictionary()
        viewBindingsDict.setValue(senderLabel, forKey: "senderLabel")
        viewBindingsDict.setValue(subjectLabel, forKey: "subjectLabel")
        viewBindingsDict.setValue(bodyPreviewLabel, forKey: "bodyPreviewLabel")
        viewBindingsDict.setValue(dateLabel, forKey: "dateLabel")
        viewBindingsDict.setValue(unreadIndicatorView, forKey: "unreadIndicatorView")
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[unreadIndicatorView]-5-[senderLabel]-[dateLabel]-|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: viewBindingsDict))
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[subjectLabel]-|", options: nil, metrics: nil, views: viewBindingsDict))
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[bodyPreviewLabel(288)]", options: nil, metrics: nil, views: viewBindingsDict))
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-7-[senderLabel][subjectLabel][bodyPreviewLabel]-7-|", options: nil, metrics: nil, views: viewBindingsDict))
        
        //contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[subjectLabel][bodyPreviewLabel]", options: nil, metrics: nil, views: viewBindingsDict))
        
        //contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[subjectLabel]-50-|", options: nil, metrics: nil, views: viewBindingsDict))
        
    }
}
