//
//  OweViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class OweViewController: UIViewController, UITableViewDataSource{
    
    var userData: UserDataViewController = UserDataViewController()

    @IBOutlet weak var owedLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var userNames = [String]()
    var userProfile = [UIImage]()
    var transAmounts = [Double]()
    var transDescriptions = [String]()
    
    var owedTransAmounts = [Double]()
    
    var owedAmount = Double()
    var owedCount = 0 as Int

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        self.tableView.rowHeight = 90

        transAmounts = userData.transAmounts
        
        //Set up array for cells
        for transAmount in transAmounts {
            if transAmount <= 0 {
                let signFlip = transAmount * -1
                let index = transAmounts.index(of: transAmount)
                owedAmount += signFlip
                owedCount += 1
                
                userNames.append(userData.userNames[index!])
                userProfile.append(userData.userProfile[index!])
                owedTransAmounts.append(signFlip)
                transDescriptions.append(userData.transDescriptions[index!])
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
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return owedCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! OwedTableViewCell
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        let userName = userNames[indexPath.row]
        let userImage = userProfile[indexPath.row]
        let transaction = owedTransAmounts[indexPath.row]
        let description = transDescriptions[indexPath.row]
        
        cell.userNameLabel.text = userName
        cell.profileImage.image = userImage
        cell.transAmountLabel.text = formatter.string(from: transaction as NSNumber)
        cell.transDescriptionLabel.text = description
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

}
