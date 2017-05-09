//
//  HomePickerViewController.swift
//  CurrencyConverter
//
//  Created by Belinda Wong on 5/6/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

class HomePickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var homePickerView: UIPickerView!
    
    var homePickerData = ["US Dollar", "Japanese Yen", "British Pound"]
    //var homePickerData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make swipe gestures
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        
        // Do any additional setup after loading the view, typically from a nib.
        homePickerView.dataSource = self
        homePickerView.delegate = self
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK : Functions
    
    // Swipe function
    func handleSwipe(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "showForeignPicker", sender: self)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int {
        return homePickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return homePickerData[row]
    }
    
    // should retrun the text of the selected element in pickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //let value = homePickerData[row]
        sharedInstance.home = homePickerData[row]
    }
    
    // allow unwinding for foreignview
    @IBAction func unwindToHome(segue:UIStoryboardSegue){
        
    }

    //  allowing access to the shared instance
    let sharedInstance: SharedVars = SharedVars.shared


}

