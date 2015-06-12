//
//  AgeGroupViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/9/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class AgeGroupViewController: BasePageViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedRow: Int? = nil
    
    
    let demographicDict = [
        BYAgeGroup.None: "Not Specified",
        BYAgeGroup.HighSchool: "High School",
        BYAgeGroup.College: "College & Young Adult",
        BYAgeGroup.Adult: "Adult",
        BYAgeGroup.Middle: "Middle Age",
        BYAgeGroup.Senior: "Senior"
    ]
    
    let ageRangesDict = [
        BYAgeGroup.None: "NONE",
        BYAgeGroup.HighSchool: "Ages 15 - 18",
        BYAgeGroup.College: "Ages 19 - 25",
        BYAgeGroup.Adult: "Ages 26 - 45",
        BYAgeGroup.Middle: "Ages 46 - 60",
        BYAgeGroup.Senior: "Ages 60+"
    ]
    
    override func viewDidLoad() {
     
        super.viewDidLoad()

        configureHeaderLabel()
        configureTableView()
    }
    
    // MARK: - Configure
    
    func configureHeaderLabel() {
        self.headerLabel.text = "To help us minister to you in a relevant and personal manner, select from the options below."
        self.headerLabel.textColor = UIColor.whiteColor()
        self.headerLabel.font = UIFont.font(BYFontType.Light, fontSize: 30)
        self.headerLabel.numberOfLines = 0
    }

    func configureTableView() {
        self.tableView.registerNib(UINib(nibName: "BYAgeTableViewCell", bundle: nil), forCellReuseIdentifier: "AgeGroupCell")
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 100
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.scrollEnabled = false
    }
    
    // MARK: - UITableView Delegate & Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AgeGroupCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! BYAgeTableViewCell
        
        // Configure cell
        let ageGroup = BYAgeGroup(rawValue: indexPath.row)!
        cell.demographicLabel.text = demographicDict[ageGroup]
        cell.ageRangeLabel.text = ageRangesDict[ageGroup]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // If it's selected, de-select it
        if selectedRow == indexPath.row {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.selectedRow = nil
        } else {
            selectedRow = indexPath.row
        }
    }

    
}
