//
//  WelcomeViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 5/31/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

protocol BYWelcomeProtocol: class {
    func goToForm(userType: BYUserType);
}

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet var userTypeButtons: [BYActionButton]!
    weak var delegate: BYWelcomeProtocol?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        configureLabel()
        self.view.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        animateWelcomeScene()
    }
    
    // MARK: - Configure
    
    private func configureLabel() {
        
        self.welcomeLabel.text = "Welcome to"
        self.welcomeLabel.textColor = UIColor.whiteColor()
        self.welcomeLabel.textAlignment = .Center
        self.welcomeLabel.font = UIFont.font(BYFontType.LightItalic, fontSize: 30)
    }
    
    // MARK: - Animate
    
    func animateWelcomeScene() {
        
        // Pre-animation setup
        let preScale: CGFloat = 1.5
        self.view.transform = CGAffineTransformMakeScale(preScale, preScale)
        self.view.hidden = false
        
        // Animate
        UIView.animateWithDuration(
            0.8,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.view.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
    
    // MARK: - Begin Form

    @IBAction func beginWithNewAttendee(sender: AnyObject) {
        self.animateAndBeginForm(BYUserType.New, buttonSelected: sender as! UIButton)
    }
    
    @IBAction func beginWithSeldomAttendee(sender: AnyObject) {
        self.animateAndBeginForm(BYUserType.Sometimes, buttonSelected: sender as! UIButton)
    }

    @IBAction func beginWithRegularAttendee(sender: AnyObject) {
        self.animateAndBeginForm(BYUserType.Regular, buttonSelected: sender as! UIButton)
    }
    
    private func animateAndBeginForm(userType: BYUserType, buttonSelected button: UIButton) {
        
        // TODO: Do some animations here
        
        UIView.animateWithDuration(
            0.2,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                let scaleUp: CGFloat = 1.2
                self.logoImageView.transform = CGAffineTransformMakeScale(scaleUp, scaleUp)
                self.logoImageView.alpha = 0
                self.welcomeLabel.transform = CGAffineTransformMakeScale(0, 0)
                self.welcomeLabel.alpha = 0
                button.transform = CGAffineTransformMakeScale(scaleUp, scaleUp)
                for userTypeButton in self.userTypeButtons {
                    if userTypeButton != button {
                        userTypeButton.transform = CGAffineTransformMakeScale(0.5, 0.5)
                    }
                    userTypeButton.alpha = 0
                }
        }) { (finished) -> Void in
            self.willMoveToParentViewController(nil)
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            self.delegate?.goToForm(userType)
        };
    }
}
