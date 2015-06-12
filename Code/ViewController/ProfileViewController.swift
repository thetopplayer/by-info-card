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
    
    
    override func viewDidLoad() {
     
        super.viewDidLoad()

        configureLabels()
        configureTextFields()
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
    
    
}
