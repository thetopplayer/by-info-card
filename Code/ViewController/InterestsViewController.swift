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
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: self.headerLabel.left, bottom: 0, right: 0)
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
    
    // MARK: - EKPageScrolling Delegate
    
    override func onScrollWithPageOnRight(offset: CGFloat) {
        
    }
    
    override func onScrollWithPageOnLeft(offset: CGFloat) {
        self.headerLabel.transform = CGAffineTransformMakeTranslation(offset * self.view.width, -self.view.height * offset * 0.2)
        for i in 0..<self.interests.count {
            let cell = self.tableView.visibleCells()[i] as! BYCheckboxTableViewCell
            let i = CGFloat(i)
            cell.transform = CGAffineTransformMakeTranslation(i * offset * -150, 0)
            cell.checkbox.transform = CGAffineTransformMakeScale((1 - (offset * 5)), (1 - (offset * 5)))
        }
    }
    
    
}
