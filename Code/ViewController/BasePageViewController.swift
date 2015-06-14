//
//  BasePageViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class BasePageViewController: UIViewController, EKPageScrolling {
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.backgroundColor = UIColor.clearColor()
    }
    
    // MARK: - EKPageScrolling (implement in subclass)
    
    func onScrollWithPageOnLeft(offset: CGFloat) {}
    func onScrollWithPageOnRight(offset: CGFloat) {}
}
