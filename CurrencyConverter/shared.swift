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
    var amount:Float = 0
    // the number to multiply homeCur with to get the converted amount
    var rate:Float = 1
    var converted:Float = 0
    
    
    // this is the array that holds the options available for homePicker and foreignPicker
    // by default I will have these in the pickers
    var pickerArray = [String]()
    
    
    // these are for all the buttons on last view; used to see if they are turned on or not
    // default is set so that first three are turned on
    var USDisOn:Bool = true
    var JPYisOn:Bool = true
    var GBPisOn:Bool = true
    var CADisOn:Bool = false
    var EURisOn:Bool = false
    var CNYisOn:Bool = false

    
    // MARK: Initialization
    private init(_ home:String = "", _ foreign:String = "", _ amount:Float = 0, _ rate:Float = 0, _ converted:Float = 0, _ pickerArray:String = ""){
        self.home = home
        self.foreign = foreign
        self.amount = amount
        self.rate = rate
        self.converted = converted
        self.pickerArray = ["US Dollar", "Japanese Yen","British Pound"]
        getSetRate(0)
    }
    
    
    //
    func getSetRate(_ num: Float)->Void{
        let getRate:Float = num
        self.rate = getRate
    }
    
    
    // MARK: Shared instance
    static let shared:SharedVars = SharedVars()
}
