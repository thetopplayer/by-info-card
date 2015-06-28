//
//  RecentSubmissionViewController.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/27/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

class RecentSubmissionViewController: UITableViewController {

    let recentSubmissions = RecentSubmissionsManager.recentSubmissions()
    let reuseIdentifier = "RecentSubmissionCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSubmissions.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = recentSubmissions[indexPath.row].userName

        return cell
    }
}
