//
//  RequestViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {

    var userData: UserDataViewController = UserDataViewController()
    
    @IBOutlet weak var lentLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lentField: UITextField!
    @IBOutlet weak var forField: UITextField!
    
    var userNames = [String]()
    var userProfile = [UIImage]()
    var transAmounts = [Double]()
    var transDescriptions = [String]()
    
    var lentTransAmounts = [Double]()
    
    var arrayCount = 0 as Int
    var lentAmount = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* tableView.dataSource = self
        self.tableView.rowHeight = 90
        
        transAmounts = userData.transAmounts
        
        //Holds array position to account for payments of the same amount
        var slot = 0 as Int
        //Set up array for cells
        for transAmount in transAmounts {
            if transAmount <= 0 {
                print("skip owed payment")
            } else {
                arrayCount += 1
                lentAmount += transAmount
                
                userNames.append(userData.userNames[slot])
                userProfile.append(userData.userProfile[slot])
                lentTransAmounts.append(transAmount)
                transDescriptions.append(userData.transDescriptions[slot])
            }
            //increment count
            slot += 1
        }*/
        
        //let formatter = NumberFormatter()
        //formatter.numberStyle = .currency
        
        //lentField.text = formatter.string(from: lentAmount as NSNumber)
        //countLabel.text = "To " + String(arrayCount) + " people"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! RequestWithViewController
        
        destinationViewController.text = lentField.text
        
    }
    
    
    @IBAction func didPressX(_ sender: Any) {
        // [1] Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeInitialController") as UIViewController
        
        // [3] Display the new view controller.
    }
    
    
    @IBAction func didPressBack(_ sender: Any) {
        // [1] Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeInitialController") as UIViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    
    /*public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lentTableCell") as! LentTableViewCell
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let userName = userNames[indexPath.row]
        let userImage = userProfile[indexPath.row]
        let transaction = lentTransAmounts[indexPath.row]
        let description = transDescriptions[indexPath.row]
        
        cell.userNameLabel.text = userName
        cell.profileImage.image = userImage
        cell.transAmountLabel.text = formatter.string(from: transaction as NSNumber)
        cell.transDescriptionLabel.text = description
        
        return cell
    }*/
    
}

