//
//  BYTextField.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class BYTextField: UITextField {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        self.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        self.textColor = UIColor.whiteColor()
        self.font = UIFont.font(BYFontType.Normal, fontSize: 20)
    }
}
