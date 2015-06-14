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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.hidden = true
        self.headerLabel.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.animateEntrance()
    }
    
    // MARK: - Animation
    
    func animateEntrance() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.headerLabel.alpha = 1
        })
        
        for cell in self.tableView.visibleCells() {
            (cell as! UITableViewCell).transform = CGAffineTransformMakeScale(0, 0)
        }
        
        self.tableView.hidden = false
        
        for i in 0..<self.interests.count {
            var cell = self.tableView.visibleCells()[i] as! UITableViewCell
            UIView.animateWithDuration(
                0.7,
                delay: Double(i) * 0.05,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: UIViewAnimationOptions.CurveEaseIn,
                animations: { () -> Void in
                    cell.transform = CGAffineTransformIdentity
                }, completion: nil)
        }
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
        self.tableView.separatorStyle = .None
        self.tableView.allowsMultipleSelection = true
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: self.headerLabel.left, bottom: 0, right: -self.headerLabel.left)
        self.tableView.bounces = false
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
