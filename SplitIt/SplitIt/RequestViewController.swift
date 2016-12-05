//
//  RequestViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var youLentTotalDetailLabel: UILabel!
    @IBOutlet weak var lentPeopleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanCell(_ sender: UIPanGestureRecognizer) {

    }// End didPanCell

    @IBAction func backTapped(_ sender: Any) {
        
    }// End backTapped Method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        // ##### FIX ME #####
        return 5
    }// End tableView Method - For Setup
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lentTableViewCell") as! lentTableViewCell
        
        // ##### FIX ME #####
        //        if let text = message["text"] as? String {
        //            cell.chatLabel.text = text
        //        }
        
        return cell
    }// End tableView Method - For Setup

}
