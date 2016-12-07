//
//  RequestReviewViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RequestReviewViewController: UIViewController {

    //var forStringPassed = ""
    @IBOutlet weak var forField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //forField.text = forStringPassed
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backArrow(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }



}
