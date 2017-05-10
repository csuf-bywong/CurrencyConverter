//
//  FavoriteViewController.swift
//  CurrencyConverter
//
//  Created by Belinda Wong on 5/7/17.
//  Copyright © 2017 Belinda Wong. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view. // Add swipe right gesture
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
        
        // have the switch on/off values equal to the default
        USDSwitch.isOn = sharedInstance.USDisOn
        JPYSwitch.isOn = sharedInstance.JPYisOn
        GBPSwitch.isOn = sharedInstance.GBPisOn
        CADSwitch.isOn = sharedInstance.CADisOn
        EURSwitch.isOn = sharedInstance.EURisOn
        CNYSwitch.isOn = sharedInstance.CNYisOn
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // Swipe function
    func handleSwipe(_ sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "unwindToForeign", sender:self)
    }
    
    // MARK : Switches
    @IBOutlet weak var USDSwitch: UISwitch!
    @IBOutlet weak var JPYSwitch: UISwitch!
    @IBOutlet weak var GBPSwitch: UISwitch!
    @IBOutlet weak var CADSwitch: UISwitch!
    @IBOutlet weak var EURSwitch: UISwitch!
    @IBOutlet weak var CNYSwitch: UISwitch!
    
   
    // MARK: Action
    
    @IBAction func updateButton(_ sender: UIButton) {
        // empty the array so it will not keep the last favorites
        sharedInstance.pickerArray = [String]()
        
        // put all button statuses to false
        sharedInstance.USDisOn = false
        sharedInstance.JPYisOn = false
        sharedInstance.GBPisOn = false
        sharedInstance.CADisOn = false
        sharedInstance.EURisOn = false
        sharedInstance.CNYisOn = false
        
        // update the buttons status's accordingly
        if USDSwitch.isOn{
            sharedInstance.pickerArray.append("US Dollar")
            sharedInstance.USDisOn = true
        }
        if JPYSwitch.isOn{
            sharedInstance.pickerArray.append("Japanese Yen")
            sharedInstance.JPYisOn = true
        }
        if GBPSwitch.isOn{
            sharedInstance.pickerArray.append("British Pound")
            sharedInstance.GBPisOn = true
        }
        if CADSwitch.isOn{
            sharedInstance.pickerArray.append("Canadian Dollar")
            sharedInstance.CADisOn = true
        }
        if EURSwitch.isOn{
            sharedInstance.pickerArray.append("European Union Euro")
            sharedInstance.EURisOn = true
        }
        if CNYSwitch.isOn{
            sharedInstance.pickerArray.append("Chinese Yuan")
            sharedInstance.CNYisOn = true
        }
    }
    
    //  allowing access to the shared instance
    let sharedInstance: SharedVars = SharedVars.shared
}
