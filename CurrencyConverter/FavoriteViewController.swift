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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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
    
    @IBAction func updateButton(_ sender: UIButton) {
        if USDSwitch.isOn{
            sharedInstance.pickerArray.append("US Dollar")
        }
        if JPYSwitch.isOn{
            sharedInstance.pickerArray.append("Japanese Yen")
        }
        if GBPSwitch.isOn{
            sharedInstance.pickerArray.append("British Pound")
        }
        if CADSwitch.isOn{
            sharedInstance.pickerArray.append("Canadian Dollar")
        }
        if EURSwitch.isOn{
            sharedInstance.pickerArray.append("European Union Euro")
        }
        if CNYSwitch.isOn{
            sharedInstance.pickerArray.append("Chinese Yuan")
        }
    }
    
    //  allowing access to the shared instance
    let sharedInstance: SharedVars = SharedVars.shared
}
