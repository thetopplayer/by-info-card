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
        self.animateAndEnter(BYUserType.New)
    }
    
    
    @IBAction func beginWithSeldomAttendee(sender: AnyObject) {
        self.animateAndEnter(BYUserType.Sometimes)
    }

    @IBAction func beginWithRegularAttendee(sender: AnyObject) {
        self.animateAndEnter(BYUserType.Regular)
    }
    
    private func animateAndEnter(userType: BYUserType) {
        
        // TODO: Do some animations here
        
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.mainLabel.transform = CGAffineTransformMakeTranslation(0, self.view.frame.size.height)
        }) { (finished) -> Void in
            self.willMoveToParentViewController(nil)
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
            self.delegate?.goToForm(userType)
        };
    }
}
