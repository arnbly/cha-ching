//
//  OweViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class OweViewController: UIViewController {
    
    var userData: UserDataViewController = UserDataViewController()

    @IBOutlet weak var owedLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userNames = userData.userNames
        let userProfile = userData.userProfile
        let transAmounts = userData.transAmounts
        let transDescriptions = userData.transDescriptions
        
        var owedAmount = Double()
        var owedCount = 0
        
        for transAmount in transAmounts {
            if transAmount <= 0 {
                let signFlip = transAmount * -1
                owedAmount += signFlip
                owedCount += 1
            } else {
                print("skip lent payment")
            }
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        owedLabel.text = formatter.string(from: owedAmount as NSNumber)
        countLabel.text = "To " + String(owedCount) + " people"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
