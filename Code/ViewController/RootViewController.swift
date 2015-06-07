//
//  RootViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/6/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

// Enum for what kind of person is filling out the form
enum BYUserType {
    case New            // First-timer
    case Sometimes      // Been here before, but not regular
    case Regular        // Regular attendee
}

class RootViewController: UIViewController, BYWelcomeProtocol {
    
    override func viewDidLoad() {

        super.viewDidLoad()

        configureWelcomeScene()
    }
    
    // MARK: Configure
    
    private func configureWelcomeScene() {
        var welcomeVC = self.storyboard?.instantiateViewControllerWithIdentifier("WelcomeVC") as! WelcomeViewController
        welcomeVC.delegate = self
        self.addChildViewController(welcomeVC)
        self.view.addSubview(welcomeVC.view)
        welcomeVC.view.frame = self.view.frame
        welcomeVC.view.backgroundColor = UIColor.clearColor()
        welcomeVC.didMoveToParentViewController(self)
    }
    
    // MARK: - BYWelcomeProtocol
    
    func goToForm(userType: BYUserType) {
        NSLog("Boom")
    }

}
