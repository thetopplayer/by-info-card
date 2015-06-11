//
//  AgeGroupViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class AgeGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
     
        super.viewDidLoad()

        
    }
    
    // MARK: - Configure
    
    func configureHeaderLabel() {
        self.headerLabel.text = "To help us minister to you in a relevant and personal manner, select from the options below."
        self.headerLabel.textColor = UIColor.whiteColor()
        self.headerLabel.font = UIFont.font(BYFontType.Light, fontSize: 30)
        self.headerLabel.numberOfLines = 0
    }

    func configureTableView() {
        self.tableView.registerNib(UINib(nibName: "ByAgeTableViewCell", bundle: nil), forCellReuseIdentifier: "AgeGroupCell")
        self.tableView.backgroundColor = UIColor.clearColor()
    }
    
    // MARK: - UITableView Delegate & Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
}
