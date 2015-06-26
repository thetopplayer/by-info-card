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
    @IBOutlet weak var submitButton: BYActionButton!
    
    var selectedRow = -1
    
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
        cell.demographicLabel.text = ageDemographics[ageGroup]?.ageGroup
        cell.ageRangeLabel.text = ageDemographics[ageGroup]?.ageRange
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ageDemographics.count-1
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
        for i in 0 ..< ageDemographics.count-1 {
            let cell = self.tableView.visibleCells()[i] as! UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(CGFloat(i) * offset * 150, 0)
        }
    }
    
    // MARK: - BYSubmissionInfoCollecting
    
    override func collectInfoForSubmission(submission: BYSubmission) {
        if self.selectedRow >= 0 {
            submission.ageGroup = BYAgeGroup(rawValue: self.selectedRow)
        }
    }
    
    
    // MARK: - Submit
    
    @IBAction func submitForm(sender: AnyObject) {
        
        if let containerVC = self.parentViewController as? ContainerViewController {
            
            if containerVC.submissionIsComplete() {
                
                let numberOfCells = self.tableView.visibleCells().count
                
                let totalDuration = 0.7
                let animDelayOffset = 0.1
                let cellAnimDuration = totalDuration - (Double(numberOfCells) * animDelayOffset)
                
                for i in 0 ..< numberOfCells {
                    if let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: i, inSection: 0)) {
                        UIView.animateWithDuration(
                            cellAnimDuration,
                            delay: animDelayOffset * Double(i),
                            options: UIViewAnimationOptions.CurveEaseInOut,
                            animations: { () -> Void in
                                cell.transform = CGAffineTransformMakeScale(1.1, 1.1)
                                cell.alpha = 0
                        }, completion: nil)
                    }
                }
                
                UIView.animateWithDuration(
                    totalDuration,
                    delay: 0,
                    options: UIViewAnimationOptions.CurveEaseInOut,
                    animations: { () -> Void in
                        self.headerLabel.transform = CGAffineTransformMakeTranslation(0, -200)
                        self.submitButton.transform = CGAffineTransformMakeScale(1.1, 1.1)
                        self.submitButton.alpha = 0
                }, completion: { (finished) -> Void in
                    
                    let loadingView = MMMaterialDesignSpinner()
                    
                    
                })
                
//                APIWrapperSubmit().submitToAPI(BYSubmission(), completion: { (success, message) -> Void in
//                    
//                })
            }
        }
    }
    
}
