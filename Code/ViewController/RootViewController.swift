//
//  RootViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/6/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

enum BYPageType {
    case Interests
    case Profile
    case AgeGroup
    case Submit
    case Done
}

class RootViewController: UIViewController, BYWelcomeProtocol, BYSubmissionFinishing {
    
    var submission: BYSubmission?
    
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
        
        self.submission = BYSubmission()
        
        let containerVC = self.storyboard?.instantiateViewControllerWithIdentifier("ContainerVC") as! UIViewController
        self.addChildViewController(containerVC)
        containerVC.view.alpha = 0
        self.view.addSubview(containerVC.view)
        containerVC.didMoveToParentViewController(self)
        
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                containerVC.view.alpha = 1
        }) { (finished) -> Void in
            
        }
    }
    
    // MARK: - BYSubmissionFinishing
    
    func returnToWelcomeScreen() {
        
    }
}
