//
//  RecentSubmissionsManager.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/27/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

let kRecentSubmissionsKey = "RecentSubmissions"

class RecentSubmissionsManager: NSObject {
    
    class func saveToRecentSubmissions(userName: String) {
        
        let newSubmission = BYRecentSubmission(userName: userName, date: NSDate())
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let archivedSubmissions = NSMutableArray(array: defaults.arrayForKey(kRecentSubmissionsKey)!)
        archivedSubmissions.addObject(NSKeyedArchiver.archivedDataWithRootObject(newSubmission))
        
        defaults.setObject(archivedSubmissions, forKey: kRecentSubmissionsKey)
    }
    
    class func recentSubmissions() -> [BYRecentSubmission] {
    
        let defaults = NSUserDefaults.standardUserDefaults()
    
        
        let archivedSubmissions = NSMutableArray()
        if let archives = defaults.arrayForKey(kRecentSubmissionsKey) {
            archivedSubmissions.addObjectsFromArray(archives)
        }
    
        var submissions: [BYRecentSubmission] = []
        for archive in archivedSubmissions {
            submissions.append(NSKeyedUnarchiver.unarchiveObjectWithData(archive as! NSData) as! BYRecentSubmission)
        }
        
        return submissions
    }
    
}
