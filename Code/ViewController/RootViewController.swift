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

class RootViewController: UIViewController, BYWelcomeTransitioning, BYSubmissionFinishing {
    
    override func viewDidLoad() {

        super.viewDidLoad()

        configureAndAnimateWelcomeScene()
    }
    
    // MARK: Configure
    
    private func configureAndAnimateWelcomeScene() {
        let welcomeVC = self.storyboard?.instantiateViewControllerWithIdentifier("WelcomeVC") as! WelcomeViewController
        welcomeVC.welcomeDelegate = self
        self.addChildViewController(welcomeVC)
        self.view.addSubview(welcomeVC.view)
        welcomeVC.view.frame = self.view.frame
        welcomeVC.didMoveToParentViewController(self)
    }
    
    // MARK: - BYWelcomeProtocol
    
    func goToForm(userType: BYUserType) {
        
        // Create container view controller
        let containerVC = self.storyboard?.instantiateViewControllerWithIdentifier("ContainerVC") as! ContainerViewController
        containerVC.submission.userType = userType
        containerVC.delegate = self
        containerVC.view.alpha = 0
        self.addChildViewController(containerVC)
        self.view.addSubview(containerVC.view)
        containerVC.didMoveToParentViewController(self)
        
        // Animate transition
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
        configureAndAnimateWelcomeScene()
    }
    
    func goToThankYouScreen() {
        
        let doneVC = self.storyboard?.instantiateViewControllerWithIdentifier("DoneVC") as! DoneViewController
        doneVC.submissionDelegate = self
        self.addChildViewController(doneVC)
        self.view.addSubview(doneVC.view)
        doneVC.view.frame = self.view.frame
        doneVC.didMoveToParentViewController(self)
    }
}
