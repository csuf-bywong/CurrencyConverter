//
//  shared.swift
//  CurrencyConverter
//
//  Created by Belinda Wong on 5/7/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit
// Making a class for the singleton
class SharedVars{
    // MARK: Properties
    var home:String = ""
    var foreign:String = ""
    // the number amount input into text field in FavoriteViewController
    var homeCur:Float = 0
    // the number to multiply homeCur with to get the converted amount
    var rate:Float = 1
    var converted:Float = 0
    // if the buttons are turned on, appened the string to this array
    var pickerArray = [String]()
    // these are all the buttons; used to see if they are turned on or not
    var USDisOn:Bool = false
    var JPYisOn:Bool = false
    var GBPisOn:Bool = false
    var CADisOn:Bool = false
    var EURisOn:Bool = false
    var CNYisOn:Bool = false

    // MARK: Initialization
    init(){
    }
    // MARK: Setters
    
    // MARK: Shared instance
    static let shared:SharedVars = SharedVars()
}
