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
    
    var selectedRow = -1

    let demographics = [
        BYAgeGroup.None: AgeDemographic(ageGroup: "Not Specified", ageRange: "NONE"),
        BYAgeGroup.HighSchool: AgeDemographic(ageGroup: "High School", ageRange: "Ages 15- 18"),
        BYAgeGroup.College: AgeDemographic(ageGroup: "College & Young Adult", ageRange: "Ages 19 - 25"),
        BYAgeGroup.Adult: AgeDemographic(ageGroup: "Adult", ageRange: "Ages 26 - 45"),
        BYAgeGroup.Middle: AgeDemographic(ageGroup: "Middle Age", ageRange: "Ages 46 - 60"),
        BYAgeGroup.Senior: AgeDemographic(ageGroup: "Senior", ageRange: "Ages 60+")
    ]
    
    override func viewDidLoad() {
     
        super.viewDidLoad()

        configureHeaderLabel()
        configureTableView()
    }
    
    // MARK: - Configure
    
    func configureHeaderLabel() {
        self.headerLabel.text = "To help us minister to you in a relevant and personal manner, please select your age group below (optional):"
        self.headerLabel.textColor = UIColor.whiteColor()
        self.headerLabel.font = UIFont.font(BYFontType.Light, fontSize: 30)
        self.headerLabel.numberOfLines = 0
    }

    func configureTableView() {
        self.tableView.registerNib(UINib(nibName: "BYAgeTableViewCell", bundle: nil), forCellReuseIdentifier: "AgeGroupCell")
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 90
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.bounces = false
    }
    
    // MARK: - UITableView Delegate & Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AgeGroupCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! BYAgeTableViewCell
        
        // Configure cell
        let ageGroup = BYAgeGroup(rawValue: indexPath.row)!
        cell.demographicLabel.text = demographics[ageGroup]?.ageGroup
        cell.ageRangeLabel.text = demographics[ageGroup]?.ageRange
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.demographics.count-1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // If it's selected, de-select it
        if selectedRow == indexPath.row {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.selectedRow = -1
        } else {
            selectedRow = indexPath.row
        }
    }
    
    // MARK: - EKPageScrollingDelegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        self.headerLabel.transform = CGAffineTransformMakeTranslation(-offset * self.view.width, -self.view.height * offset * 0.3)
        for i in 0..<self.demographics.count-1 {
            let cell = self.tableView.visibleCells()[i] as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * 150, 0)
        }
    }
    
    // MARK: - Submit
    
    @IBAction func submitForm(sender: AnyObject) {
        
        
        // TODO: send off to database or email
        
        
        
        APIWrapperSubmit().submitToAPI(BYSubmission(), completion: { (success, message) -> Void in
            
            
            
        })
    }
    
}
