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
}
