//
//  PersonDetailViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.image = UIImage(named: "m3.png")!
        profileImage.layer.cornerRadius = 62
        
        tableView.dataSource = self
        self.tableView.rowHeight = 90


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailTableCell") as! DetailTableViewCell
//        
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        
//        let userName = userNames[indexPath.row]
//        let userImage = userProfile[indexPath.row]
//        let transaction = owedTransAmounts[indexPath.row]
//        let description = transDescriptions[indexPath.row]
//        
//        cell.userNameLabel.text = userName
//        cell.profileImage.image = userImage
//        cell.transAmountLabel.text = formatter.string(from: transaction as NSNumber)
//        cell.transDescriptionLabel.text = description
        
        return cell
    }

}
