//
//  BYActionButton.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/3/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class BYActionButton: UIButton {
    
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
        self.titleLabel?.font = UIFont.font(BYFontType.Normal, fontSize: 25)
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = 4
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel?.textColor = UIColor.whiteColor()
    }
    
    

}
