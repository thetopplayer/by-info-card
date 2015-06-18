//
//  DoneViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit


class DoneViewController: BasePageViewController {

    @IBOutlet weak var thankYouLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var getConnectedLabel: UILabel!
    weak var submissionDelegate: BYSubmissionFinishing?
    
    override func viewDidLoad() {

        super.viewDidLoad()

        self.configureLabels()
        self.view.hidden = true
        self.view.backgroundColor = UIColor.clearColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.animateEntrance()
        NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector: "animateExit", userInfo: nil, repeats: false)
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
        self.contactLabel.font = UIFont.font(BYFontType.Light, fontSize: 40)
        
        self.getConnectedLabel.text = "Get connected to Bryte Youth"
        self.getConnectedLabel.textColor = UIColor.whiteColor()
        self.getConnectedLabel.textAlignment = .Center
        self.getConnectedLabel.font = UIFont.font(BYFontType.LightItalic, fontSize: 30)
    }
    
    // MARK: - Animations
    
    func animateEntrance() {
        
        self.view.transform = CGAffineTransformMakeScale(0, 0)
        self.view.hidden = false
        
        UIView.animateWithDuration(
            0.9,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.view.transform = CGAffineTransformIdentity
        }) { (finished) -> Void in
            
        }
    }
    
    func animateExit() {
        UIView.animateWithDuration(
            0.8,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseOut,
            animations: { () -> Void in
                let scale: CGFloat = 0.8
                self.view.transform = CGAffineTransformMakeScale(scale, scale)
                self.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.willMoveToParentViewController(nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
                self.submissionDelegate?.returnToWelcomeScreen()
        }
    }
    
}
