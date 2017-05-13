//
//  YQLimplementation.swift
//  CurrencyConverter
//
//  Created by Belinda Wong on 5/9/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import Foundation
func getRate()->Float{

    // Example usage
    let myYQL = YQL()
    let queryString = "select * from yahoo.finance.xchange where pair in (\"EURUSD\", \"GBPUSD\")"
    var rate:Float = 0
    
    // Network session is asyncronous so use a closure to act upon data once data is returned
    myYQL.query(queryString) { jsonDict in

        // With the resulting jsonDict, pull values out
        // jsonDict["query"] results in an Any? object
        // to extract data, cast to a new dictionary (or other data type)
        // repeat this process to pull out more specific information

        let queryDict = jsonDict["query"] as! [String: Any]
        let resultsDict = queryDict["results"] as! [String: Any]
        let rateArray = resultsDict["rate"] as! [Any]
        let rateDict = rateArray[0] as! [String: Any]
        rate = Float(rateDict["Rate"] as! String)!

        sharedInstance.getSetRate(rate)
        sharedInstance.rate = rate
        
        sharedInstance.converted = sharedInstance.amount * sharedInstance.rate
    }
    //sharedInstance.getSetRate(rate)
    //sharedInstance.rate = rate
    return rate
}
//  allowing access to the shared instance
let sharedInstance: SharedVars = SharedVars.shared
