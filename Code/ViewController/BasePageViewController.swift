//
//  BasePageViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class BasePageViewController: UIViewController {

    weak var delegate: BYPageAnimating?
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.backgroundColor = UIColor.clearColor()
    }
}
