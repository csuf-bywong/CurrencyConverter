//
//  ForeignPickerViewController.swift
//  CurrencyConverter
//
//  Created by Belinda Wong on 5/7/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

class ForeignPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var foreignPickerView: UIPickerView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var convertedLabel: UILabel!
    
    
    // initialize it to empty
    var foreignPickerData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the data inside the pickerView to the singleton data
        foreignPickerData = sharedInstance.pickerArray
        
        // Make swipe gestures so that user can swipe to traverse between screens
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleLeft))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleRight))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
        
        // Do any additional setup after loading the view, typically from a nib.
        foreignPickerView.dataSource = self
        foreignPickerView.delegate = self
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK : Functions
    // Swipe function
    func handleRight(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "unwindToHome", sender: self)
    }
    
    
    func handleLeft(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "showFavoriteView", sender: self)
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int {
        return foreignPickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foreignPickerData[row]
    }
    
    // Function to calculate the currency conversion
    @IBAction func calcButton(_ sender: UIButton) {
        // this should give us the rate
        sharedInstance.rate = getRate()
        
        
        // variable initialization
        var amount:Float = 0
    
        // set variable equal to numbers inside the text field
        amount = Float(amountTextField.text!)!
        sharedInstance.amount = amount
        
        
        var homeSymbol:String = ""
        var foreignSymbol:String = ""
        
        
        //do the symbol assignments
        // also update the strings holding the row data to put into query string
        switch sharedInstance.home{
        case "US Dollar":
            homeSymbol = "$"
            sharedInstance.home = "USD"
        case "Japanese Yen":
            homeSymbol = "¥"
            sharedInstance.home = "JPY"
        case "British Pound":
                homeSymbol = "£"
            sharedInstance.home = "GBP"
        case "Canadian Dollar":
            homeSymbol = "C$"
            sharedInstance.home = "CAD"
        case "European Union Euro":
            homeSymbol = "€"
            sharedInstance.home = "EUR"
        case "Chinese Yuan":
            homeSymbol = "元"
            sharedInstance.home = "CNY"
        default:
            homeSymbol = " "
        }
        switch sharedInstance.foreign{
        case "US Dollar":
            foreignSymbol = "$"
            sharedInstance.foreign = "USD"
        case "Japanese Yen":
            foreignSymbol = "¥"
            sharedInstance.foreign = "JPY"
        case "British Pound":
            foreignSymbol = "£"
            sharedInstance.foreign = "GBP"
        case "Canadian Dollar":
            foreignSymbol = "C$"
            sharedInstance.foreign = "CAD"
        case "European Union Euro":
            foreignSymbol = "€"
            sharedInstance.foreign = "EUR"
        case "Chinese Yuan":
            foreignSymbol = "元"
            sharedInstance.foreign = "CNY"
        default:
            foreignSymbol = " "
        }
        
        
        // doing the calculation for converted currency
        sharedInstance.converted = sharedInstance.amount * sharedInstance.rate
        
        
        // update the convertedLabel text
        convertedLabel.text = "\(homeSymbol)\(amount) is \(foreignSymbol)\(sharedInstance.converted) with rate \(sharedInstance.rate)"
    }
    
    
    // should retrun the text of the selected element in pickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //let value = foreignPickerData[row]
        sharedInstance.foreign = foreignPickerData[row]
        convertedLabel.text = sharedInstance.foreign
    }
    
    
    // updates the data inside the pickerView
    @IBAction func updatePickerButton(_ sender: UIButton) {
        foreignPickerData = sharedInstance.pickerArray
        foreignPickerView.reloadAllComponents()
    }
    
    
    //Enable unwinding other views
    @IBAction func unwindToForeignPickerView(segue:UIStoryboardSegue){
    }
    
    
    //  allowing access to the shared instance
    let sharedInstance: SharedVars = SharedVars.shared
}

