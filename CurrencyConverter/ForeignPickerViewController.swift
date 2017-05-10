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
    
    
    var foreignPickerData = ["US Dollar", "Japanese Yen", "British Pound"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make swipe gestures
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
        exampleUsage()
        
        
        // variable initialization
        var amount:Float = 0
        // set variable equal to numbers inside the text field
        amount = Float(amountTextField.text!)!
        sharedInstance.amount = amount
        
        var homeSymbol:String = ""
        var foreignSymbol:String = ""
        //do the symbol assignments
        switch sharedInstance.home{
        case "US Dollar":
            homeSymbol = "$"
        case "Japanese Yen":
            homeSymbol = "¥"
        case "British Pound":
                homeSymbol = "£"
        case "Canadian Dollar":
            homeSymbol = "C$"
        case "European Union Euro":
            homeSymbol = "€"
        case "Chinese Yuan":
                    homeSymbol = "元"
        default:
            homeSymbol = " "
        }
        switch sharedInstance.foreign{
        case "US Dollar":
            foreignSymbol = "$"
        case "Japanese Yen":
            foreignSymbol = "¥"
        case "British Pound":
            foreignSymbol = "£"
        case "Canadian Dollar":
            foreignSymbol = "C$"
        case "European Union Euro":
            foreignSymbol = "€"
        case "Chinese Yuan":
            foreignSymbol = "元"
        default:
            foreignSymbol = " "
        }
        // update the convertedLabel text
        convertedLabel.text = "\(homeSymbol)\(amount) is \(foreignSymbol)\(sharedInstance.converted) with rate \(sharedInstance.rate)"
    }
    
    // should retrun the text of the selected element in pickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //let value = foreignPickerData[row]
        sharedInstance.foreign = foreignPickerData[row]
        convertedLabel.text = sharedInstance.foreign
    }
    
    //Enable unwinding other views
    @IBAction func unwindToForeignPickerView(segue:UIStoryboardSegue){
    }
    
    //  allowing access to the shared instance
    let sharedInstance: SharedVars = SharedVars.shared
}

