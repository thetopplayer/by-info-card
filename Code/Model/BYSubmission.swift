//
//  BYSubmission.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/6/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import UIKit

// Enum for what kind of person is filling out the form
enum BYUserType {
    case New            // First-timer
    case Sometimes      // Been here before, but not regular
    case Regular        // Regular attendee
}

let attendeeTypeStrings: [BYUserType: String] = [
    .New: "New",
    .Sometimes: "Sometimes",
    .Regular: "Regular"
]

enum BYAgeGroup: Int {
    case None = -1
    case HighSchool
    case College
    case Adult
    case Middle
    case Senior
}

struct AgeDemographic {
    var ageGroup: String!
    var ageRange: String!
}

let ageDemographics = [
    BYAgeGroup.None: AgeDemographic(ageGroup: "Not Specified", ageRange: "NONE"),
    BYAgeGroup.HighSchool: AgeDemographic(ageGroup: "High School", ageRange: "Ages 15- 18"),
    BYAgeGroup.College: AgeDemographic(ageGroup: "College & Young Adult", ageRange: "Ages 19 - 25"),
    BYAgeGroup.Adult: AgeDemographic(ageGroup: "Adult", ageRange: "Ages 26 - 45"),
    BYAgeGroup.Middle: AgeDemographic(ageGroup: "Middle Age", ageRange: "Ages 46 - 60"),
    BYAgeGroup.Senior: AgeDemographic(ageGroup: "Senior", ageRange: "Ages 60+")
]


class BYSubmission: NSObject {
    
    var userType: BYUserType?
    
    var interests: [String]?
    
    var name: String?
    
    var email: String?
    
    var phone: String?
    
    var ageGroup: BYAgeGroup?
    
    var comments: String?
}

class BYRecentSubmission: NSObject, NSCoding {
    
    var userName: String
    var date: NSDate
    let kUserNameKey = "userName"
    let kDateKey = "date"
    
    init(userName: String, date: NSDate) {
        self.userName = userName
        self.date = date
    }
    
    required init(coder aDecoder: NSCoder) {
        userName = aDecoder.decodeObjectForKey(kUserNameKey) as! String
        date = aDecoder.decodeObjectForKey(kDateKey) as! NSDate
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(userName, forKey: kUserNameKey)
        aCoder.encodeObject(date, forKey: kDateKey)
    }
}
