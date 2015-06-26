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
    private let url = NSURL(string: "https://docs.google.com/forms/d/1uB227lLrQyZNK36BB8cW8ZJuYjBST_Qy2SG9RfY3GV0/formResponse")!
    private var connection: NSURLConnection?
    
    func submitToAPI(submission: BYSubmission, completion: (success: Bool, message: String?) -> Void) {
        
        let postData = "entry.141171165=I've Been Here Before&entry.1399715047=Ministry&entry.1750756117=Eddie Kaiger&entry.1778959864=eddiekaiger@gmail.com&entry.1184327797=559-593-3679&entry.1814542145=College & Young Adult (19 - 25)"
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        request.timeoutInterval = 10
        
        connection = NSURLConnection(request: request, delegate: self)
        connection?.start()
    }
}

// MARK: NSURLConnectionDelegate

extension APIWrapperSubmit: NSURLConnectionDelegate {
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        NSLog("Connection finished loading.")
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        responseData.appendData(data)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        NSLog("Error sending submission: %@", error)
    }
}
    

