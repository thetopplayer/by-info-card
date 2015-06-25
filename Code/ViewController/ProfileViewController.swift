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
    
    private let defaultSpacerHeight: CGFloat = 50
    private let reducedSpacerHeight: CGFloat = 30
    
    private var tapToDismissRecognizer: UITapGestureRecognizer! {
        return UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    }
    
    override func viewDidLoad() {
     
        super.viewDidLoad()

        configureLabels()
        configureTextFields()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureKeyboardListeners()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardListeners()
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
    
    private func removeKeyboardListeners() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow() {
        spacerHeightConstraint.constant = reducedSpacerHeight
        UIView.animateWithDuration(
            0.7,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
            }, completion: nil)
        self.view.addGestureRecognizer(self.tapToDismissRecognizer)
    }
    
    func keyboardWillHide() {
        spacerHeightConstraint.constant = defaultSpacerHeight
        UIView.animateWithDuration(
            0.7,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.view.layoutIfNeeded()
        }, completion: nil)
        self.view.removeGestureRecognizer(self.tapToDismissRecognizer)
    }
    
    @objc private func dismissKeyboard() {
        for textField in self.textFields {
            textField.resignFirstResponder()
        }
    }
    
    // MARK: - EKPageScrolling
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        spacerHeightConstraint.constant = defaultSpacerHeight + (50 * offset)
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        spacerHeightConstraint.constant = defaultSpacerHeight + (50 * offset)
    }
    
}
