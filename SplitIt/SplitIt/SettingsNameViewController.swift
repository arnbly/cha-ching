//
//  SettingsNameViewController.swift
//  SplitIt
//
//  Created by Amrutha Krishnan on 12/3/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class SettingsNameViewController: UIViewController {
    
    
    @IBOutlet weak var userNameField: UITextField!
    
    var namevalue = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.text = namevalue
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func dismissSettingsNameViewControllerButton(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
}
