//
//  APIWrapperSubmit.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/22/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import Foundation

class APIWrapperSubmit: NSObject {
    
    private var responseData = NSMutableData()
    private var connection: NSURLConnection?
    private var completionCallback: ((Bool) -> Void)?
    
    private let url = NSURL(string: "https://docs.google.com/forms/d/1uB227lLrQyZNK36BB8cW8ZJuYjBST_Qy2SG9RfY3GV0/formResponse")!

    private let kUserTypeEntryKey = "entry.141171165"
    private let kInterestsKey = "entry.1399715047"
    private let kNameKey = "entry.1750756117"
    private let kEmailKey = "entry.1778959864"
    private let kPhoneNumberKey = "entry.1184327797"
    private let kAgeGroupKey = "entry.1814542145"
    
    func submitToAPI(submission: BYSubmission, completion: (success: Bool) -> Void) {
        
        // Create post string
        var postData = kUserTypeEntryKey + "=" + attendeeTypeStrings[submission.userType!]!
        if let interests = submission.interests {
            if interests.count > 0 {
                postData += "&" + kInterestsKey + "="
                for i in 0 ..< interests.count {
                    postData += interests[i].stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)! + (i < interests.count-1 ? ", " : "")
                }
            }
        }
        postData += "&" + kNameKey + "=" + submission.name!
        if let email = submission.email {
            postData += "&" + kEmailKey + "=" + clean(email)
        }
        if let phoneNumber = submission.phone {
            postData += "&" + kPhoneNumberKey + "=" + clean(phoneNumber)
        }
        if let ageGroup = submission.ageGroup {
            let ageGroupString = clean(ageDemographics[ageGroup]!.ageGroup) + " (" + ageDemographics[ageGroup]!.ageRange + ")"
            postData += "&" + kAgeGroupKey + "=" + ageGroupString
        }

        self.completionCallback = completion
        
        // Create request
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        request.timeoutInterval = 10
        
        // Send that thing off, yo
        connection = NSURLConnection(request: request, delegate: self)
        connection?.start()
    }
    
    private func clean(str: String) -> String {
        return str.stringByReplacingOccurrencesOfString("&", withString: "%26")
    }
}


// MARK: NSURLConnectionDelegate

extension APIWrapperSubmit: NSURLConnectionDelegate {
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        // Get it, get it, we reached the Interwebz
        NSLog("Connection finished loading.")
        completionCallback?(true)
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData.appendData(data)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        // NCD (no can do)
        NSLog("Error sending submission: %@", error)
        completionCallback?(false)
    }
}
    

