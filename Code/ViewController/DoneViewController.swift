//
//  DoneViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit


protocol BYSubmissionFinishing: class {
    func returnToWelcomeScreen();
}

class DoneViewController: UIViewController {

    @IBOutlet weak var thankYouLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var getConnectedLabel: UILabel!
    weak var delegate: BYSubmissionFinishing?
    
    override func viewDidLoad() {

        super.viewDidLoad()

        self.configureLabels()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.animateExit()
    }
    
    // MARK: - Configure
    
    func configureLabels() {
        
        self.thankYouLabel.text = "THANK YOU"
        self.thankYouLabel.textAlignment = .Center
        self.thankYouLabel.textColor = UIColor.whiteColor()
        self.thankYouLabel.font = UIFont.font(BYFontType.Light, fontSize: 80)
        
        self.contactLabel.text = "We'll contact you soon."
        self.contactLabel.textAlignment = .Center
        self.contactLabel.textColor = UIColor.whiteColor()
        self.contactLabel.font = UIFont.font(BYFontType.Light, fontSize: 50)
        
        self.getConnectedLabel.text = "Get connected to Bryte Youth"
        self.getConnectedLabel.textColor = UIColor.whiteColor()
        self.getConnectedLabel.textAlignment = .Center
        self.getConnectedLabel.font = UIFont.font(BYFontType.LightItalic, fontSize: 40)
    }
    
    func animateExit() {
        UIView.animateWithDuration(
            0.7,
            delay: 5.0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                // TODO: add animations here
        }) { (finished) -> Void in
            self.delegate?.returnToWelcomeScreen()
        }
    }
    
}
