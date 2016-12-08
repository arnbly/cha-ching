//
//  TransactionDetailViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class TransactionDetailViewController: UIViewController {

    @IBOutlet weak var amountInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapBack(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        amountInput.textColor = UIColor(colorLiteralRed: 127, green: 146, blue: 255, alpha: 1)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        amountInput.textColor = UIColor(colorLiteralRed: 21, green: 35, blue: 54, alpha: 1)
    }

}
