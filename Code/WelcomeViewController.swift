//
//  WelcomeViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 5/31/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        configureLabels()
        configureButtons()
    }
    
    // MARK: - Configure
    
    func configureLabels() {
        
        self.welcomeLabel.text = "Welcome to"
        self.welcomeLabel.textColor = UIColor.whiteColor()
        self.welcomeLabel.textAlignment = .Center
        self.welcomeLabel.font = UIFont(name: "Avenir-BookOblique", size: 50)
        
        self.mainLabel.text = "BRYTE YOUTH"
        self.mainLabel.textColor = UIColor.whiteColor()
        self.mainLabel.textAlignment = .Center
        self.mainLabel.font = UIFont(name: "Avenir-Light", size: 80)
    }
    
    func configureButtons() {
        
    }
}
