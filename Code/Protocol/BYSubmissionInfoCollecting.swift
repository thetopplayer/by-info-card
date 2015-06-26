//
//  BYSubmissionInfoCollecting.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/25/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import Foundation

protocol BYSubmissionInfoCollecting {
    
    /** Function used for collecting pieces of submission info from each page */
    func collectInfoForSubmission(submission: BYSubmission)
}