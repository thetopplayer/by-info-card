//
//  InterestsViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class InterestsViewController: BasePageViewController {

    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.configureHeaderLabel()
    }
    
    // MARK: - Configure
    
    func configureHeaderLabel() {
        self.headerLabel.text = "Interested in..."
        self.headerLabel.textColor = UIColor.whiteColor()
        self.headerLabel.font = UIFont.font(BYFontType.Normal, fontSize: 50)
    }
    
    
}
