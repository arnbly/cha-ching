//
//  HomeViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var userData: UserDataViewController = UserDataViewController()

    @IBOutlet weak var lentLabel: UILabel!
    @IBOutlet weak var owedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userNames = userData.userNames
        let userProfile = userData.userProfile
        let transAmounts = userData.transAmounts
        let transDescriptions = userData.transDescriptions
        
        var lentAmount = Double()
        var owedAmount = Double()
        
        for transAmount in transAmounts {
            if transAmount <= 0 {
                let signFlip = transAmount * -1
                owedAmount += signFlip
                print(owedAmount)
            } else {
                lentAmount += transAmount
                print(lentAmount)
            }
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        lentLabel.text = formatter.string(from: lentAmount as NSNumber)
        owedLabel.text = formatter.string(from: owedAmount as NSNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressPay(_ sender: Any) {
        
        // [1] Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "PayFlow", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "PayFlowSB") as UIViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func didPressRequest(_ sender: Any) {
        // [1] Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "RequestFlow", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "RequestFlowSB") as UIViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    func currencyStringFromNumber(number: NSNumber) -> String {
        let formatter = NumberFormatter()
        let locale = Locale.current

        formatter.numberStyle = .currency
        formatter.currencySymbol = locale.currencySymbol
        return formatter.string(from: number)!
    }

    
    @IBAction func didTapHistoryButton(_ sender: Any) {
    
        let historytoryboard = UIStoryboard(name: "History", bundle: nil)
        let historycontroller = historytoryboard.instantiateViewController(withIdentifier:
            "HistoryFlowSB") as! HistoryViewController
        self.present(historycontroller, animated: true, completion: nil)
        

    
    
    }
    
    

}
