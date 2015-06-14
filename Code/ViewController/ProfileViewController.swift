//
//  ProfileViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class ProfileViewController: BasePageViewController {

    @IBOutlet var labels: [UILabel]!
    @IBOutlet var textFields: [BYTextField]!
    
    @IBOutlet weak var nameField: BYTextField!
    @IBOutlet weak var emailField: BYTextField!
    @IBOutlet weak var phoneField: BYTextField!

    @IBOutlet weak var spacerHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
     
        super.viewDidLoad()

        configureLabels()
        configureTextFields()
        configureKeyboardListeners()
    }
    
    // MARK: - Configure
    
    func configureLabels() {
        for label in self.labels {
            label.textAlignment = .Right
            label.textColor = UIColor.whiteColor()
            label.font = UIFont.font(BYFontType.Light, fontSize: 25)
        }
    }
    
    func configureTextFields() {

        for textField in self.textFields {
            textField.textColor = UIColor.whiteColor()
            textField.tintColor = UIColor(white: 0, alpha: 0.4)
            textField.font = UIFont.font(BYFontType.Normal, fontSize: 35)
            textField.autocorrectionType = .No
        }
        
        self.nameField.autocapitalizationType = .Words
        self.emailField.autocapitalizationType = .None
        
        self.nameField.keyboardType = UIKeyboardType.Default
        self.emailField.keyboardType = UIKeyboardType.EmailAddress
        self.phoneField.keyboardType = UIKeyboardType.PhonePad
    }
    
    // MARK: - Keyboard Listeners
    
    func configureKeyboardListeners() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow() {
        spacerHeightConstraint.constant = 25
        UIView.animateWithDuration(
            0.7,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    func keyboardWillHide() {
        spacerHeightConstraint.constant = 50
        UIView.animateWithDuration(
            0.7,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}
