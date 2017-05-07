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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        homePickerView.dataSource = self
        homePickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


}

