//
//  ForeignPickerViewController.swift
//  CurrencyConverter
//
//  Created by Belinda Wong on 5/7/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

class ForeignPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var foreignPickerView: UIPickerView!
    
    
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
    
    //Enable unwinding other views
    @IBAction func unwindToForeignPickerView(segue:UIStoryboardSegue){
    }
    
    
}

