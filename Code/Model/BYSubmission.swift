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

enum BYAgeGroup {
    case None
    case HighSchool
    case College
    case Adult
    case Middle
    case Senior
}

class BYSubmission: NSObject {
    
    var userType: BYUserType?
    
    var interests = [String]()
    
    var name: String?
    
    var email: String?
    
    var phone: String?
    
    var ageGroup: BYAgeGroup?
    
    var comments: String?
}
