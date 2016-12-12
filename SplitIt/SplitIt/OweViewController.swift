//
//  OweViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class OweViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
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
    let formatter = NumberFormatter()
    
    let greenColor = UIColor(red: 85/255, green: 229/255, blue: 179/255, alpha: 1)
    let purpleColor = UIColor(red: 127/255, green: 146/255, blue: 255/255, alpha: 1)
    let grayColor = UIColor(red: 214/255, green: 216/255, blue: 219/255, alpha: 1)
    let redColor = UIColor(red: 255/255, green: 140/255, blue: 127/255, alpha: 1)
    
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
        
        return userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! owedSwipeTableCell
        
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
        
        cell.leftButtons = [MGSwipeButton(title: "", icon: UIImage(named:"cash-icon.png"), backgroundColor: greenColor)]
        cell.rightButtons = [MGSwipeButton(title: "", icon: UIImage(named:"check-icon.png"), backgroundColor: purpleColor)]
        
        //configure left buttons
        cell.leftSwipeSettings.transition = MGSwipeTransition.drag
        cell.leftSwipeSettings.threshold = 100
        
        cell.leftExpansion.expansionColor = greenColor
        cell.leftExpansion.fillOnTrigger = true
        cell.leftExpansion.buttonIndex = 0
        cell.leftExpansion.threshold = 100
        
        //configure right buttons
        cell.rightSwipeSettings.transition = MGSwipeTransition.drag
        cell.leftExpansion.expansionColor = purpleColor
        cell.leftExpansion.fillOnTrigger = true
        
        return cell
    }
    
//    func deleteMail(_ path:IndexPath) {
//    //    tableView.deleteRows(at: [path], with: .left);
//    }
//    
//    func swipeTableCell(_ cell: MGSwipeTableCell, swipeButtonsFor direction: MGSwipeDirection, swipeSettings: MGSwipeSettings, expansionSettings: MGSwipeExpansionSettings) -> [UIView]? {
//        
//        expansionSettings.buttonIndex = 0
//        
//        
//        expansionSettings.fillOnTrigger = true;
//        expansionSettings.threshold = 2;
//            
//        cell.refreshContentView();
//    
//        return cell
//    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //update page header
            owedAmount = owedAmount - owedTransAmounts[indexPath.row]
            owedCount -= 1
            owedLabel.text = formatter.string(from: owedAmount as NSNumber)
            countLabel.text = "To " + String(owedCount) + " people"
            
            //remove data from array
            self.userNames.remove(at: indexPath.row)
            self.userProfile.remove(at: indexPath.row)
            self.owedTransAmounts.remove(at: indexPath.row)
            self.transDescriptions.remove(at: indexPath.row)
            
            self.tableView.reloadData()
        }
    }

}
