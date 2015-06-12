//
//  InterestsViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class InterestsViewController: BasePageViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let kInterestsCellIdentifier = "InterestsCell"
    
    let interests = [
        "A relationship with Jesus",
        "Baptism and/or church membership",
        "Events",
        "Community Groups",
        "Ministry"
    ]
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.configureHeaderLabel()
        self.configureTableView()
    }
    
    // MARK: - Configure
    
    func configureHeaderLabel() {
        self.headerLabel.text = "Interested in..."
        self.headerLabel.textColor = UIColor.whiteColor()
        self.headerLabel.font = UIFont.font(BYFontType.Normal, fontSize: 50)
    }
    
    func configureTableView() {
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.rowHeight = 80
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "BYCheckboxTableViewCell", bundle: nil), forCellReuseIdentifier: kInterestsCellIdentifier)
        self.tableView.scrollEnabled = false
        self.tableView.separatorStyle = .None
        self.tableView.allowsMultipleSelection = true
    }
    
    // MARK: - UITableView DataSource & Delegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(kInterestsCellIdentifier) as! BYCheckboxTableViewCell
        
        cell.descriptionLabel.text = interests[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interests.count
    }
    
    
}
