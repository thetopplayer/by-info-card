//
//  BYActionButton.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/3/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class BYActionButton: UIButton {
    
    override var highlighted: Bool {
        didSet {
            if self.highlighted {
                self.backgroundColor = UIColor(white: 1, alpha: 0.2)
            } else {
                self.backgroundColor = UIColor.clearColor()
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    func setup() {
        self.titleLabel?.textAlignment = .Center
        self.titleLabel?.font = UIFont.font(BYFontType.Light, fontSize: 25)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 3
        self.backgroundColor = UIColor.clearColor()
    }
}
