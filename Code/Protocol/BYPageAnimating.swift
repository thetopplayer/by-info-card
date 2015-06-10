//
//  BYPageAnimating.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import Foundation
import UIKit

protocol BYPageAnimating: class {
    
    func pageWillExit(viewController: UIViewController, pageType: BYPageType);
    
    func pageDidExit(viewController: UIViewController, pageType: BYPageType);
    
    func pageWillEnter(viewCOntroller: UIViewController, pageType: BYPageType);
    
    func pageDidEnter(viewController: UIViewController, pageType: BYPageType);
    
}
