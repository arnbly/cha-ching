//
//  SettingsEmailViewController.swift
//  SplitIt
//
//  Created by Amrutha Krishnan on 12/3/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class SettingsEmailViewController: UIViewController {
    
    
    @IBOutlet weak var userEmailField: UITextField!
    
    
    var emailvalue = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userEmailField.text = emailvalue
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
    
    @IBAction func dismissSettingsEmailViewControllerButton(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
}
