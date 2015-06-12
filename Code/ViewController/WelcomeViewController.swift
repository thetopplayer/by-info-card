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
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet var userTypeButtons: [BYActionButton]!
    weak var delegate: BYWelcomeProtocol?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        configureLabels()
    }
    
    // MARK: - Configure
    
    private func configureLabels() {
        
        self.welcomeLabel.text = "Welcome to"
        self.welcomeLabel.textColor = UIColor.whiteColor()
        self.welcomeLabel.textAlignment = .Center
        self.welcomeLabel.font = UIFont.font(BYFontType.LightItalic, fontSize: 40)
        
        self.mainLabel.text = "BRYTE YOUTH"
        self.mainLabel.textColor = UIColor.whiteColor()
        self.mainLabel.textAlignment = .Center
        self.mainLabel.font = UIFont.font(BYFontType.Light, fontSize: 80)
    }
    

    @IBAction func beginWithNewAttendee(sender: AnyObject) {
        self.animateAndEnter(BYUserType.New, buttonSelected: sender as! UIButton)
    }
    
    @IBAction func beginWithSeldomAttendee(sender: AnyObject) {
        self.animateAndEnter(BYUserType.Sometimes, buttonSelected: sender as! UIButton)
    }

    @IBAction func beginWithRegularAttendee(sender: AnyObject) {
        self.animateAndEnter(BYUserType.Regular, buttonSelected: sender as! UIButton)
    }
    
    private func animateAndEnter(userType: BYUserType, buttonSelected button: UIButton) {
        
        // TODO: Do some animations here
        
        UIView.animateWithDuration(
            0.3,
            delay: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                let scaleTransform: CGFloat = 1.5
                self.mainLabel.transform = CGAffineTransformMakeScale(scaleTransform, scaleTransform)
                self.mainLabel.alpha = 0
                self.welcomeLabel.transform = CGAffineTransformMakeScale(0, 0)
                self.welcomeLabel.alpha = 0
                button.transform = CGAffineTransformMakeScale(scaleTransform, scaleTransform)
                for userTypeButton in self.userTypeButtons {
                    if userTypeButton != button {
                        userTypeButton.transform = CGAffineTransformMakeScale(0, 0)
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
