//
//  SettingsCurrencyViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class SettingsCurrencyViewController: UIViewController {
    
    
    @IBOutlet weak var dollarButton: UIButton!
    @IBOutlet weak var poundButton: UIButton!
    @IBOutlet weak var euroButton: UIButton!
    
    var currency = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currency == "USD" {
            dollarButton.isSelected = true
            euroButton.isSelected = false
            poundButton.isSelected = false
            
        }else if currency == "EUR" {
            dollarButton.isSelected = false
            euroButton.isSelected = true
            poundButton.isSelected = false
            
        }else if currency == "UKP" {
            dollarButton.isSelected = false
            euroButton.isSelected = false
            poundButton.isSelected = true
            
        }
        
        
    }
    
    
    
    @IBAction func dismissSettingsCurrencyViewControllerButton(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func didTapPoundButton(_ sender: UIButton) {
        
        
        dollarButton.isSelected = false
        euroButton.isSelected = false
        poundButton.isSelected = true
        
        currency = "UKP"
        print(currency)
        
    }
    
    
    @IBAction func didTapEuroButton(_ sender: UIButton) {
        
        dollarButton.isSelected = false
        euroButton.isSelected = true
        poundButton.isSelected = false
        
        currency = "EUR"
        print(currency)
    }
    
    
    @IBAction func didTapDollarButton(_ sender: UIButton) {
        
        dollarButton.isSelected = true
        euroButton.isSelected = false
        poundButton.isSelected = false
        currency = "USD"
        print(currency)
        
    }
    
    @IBAction func didTapSaveCurrencyButton(_ sender: UIButton) {
        // [1] Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "SettingsSB") as! SettingsViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! SettingsViewController
        
        destinationViewController.userCurrency.text = currency
        
    }
    
}
