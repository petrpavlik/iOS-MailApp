//
//  UnreadMailIndicatorView.swift
//  MailApp
//
//  Created by Petr Pavlik on 12/07/14.
//  Copyright (c) 2014 Petr Pavlik. All rights reserved.
//

import UIKit

class UnreadMailIndicatorView: UIView {
    
    init(frame: CGRect)  {
        super.init(frame: frame)
        
        configure()
    }
    
    func configure() {
        
        backgroundColor = UIColor(red: 0.341, green: 0.671, blue: 1.000, alpha: 1)
        layer.cornerRadius = intrinsicContentSize().width/2
        clipsToBounds = true
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(12, 12)
    }

}
