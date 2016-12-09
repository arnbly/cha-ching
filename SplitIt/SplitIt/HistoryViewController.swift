//
//  HistoryViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var historySearch: UISearchBar!
    
    var text: String!
    let names = ["Clare Corthell", "Lauren Tindal"]
    let desc = [" Dinner", "Dinner","Dinner and Drinks","Lunch","Grocery"]
    let amt = ["$25","$15","$20", "$12","$10"]

    var digits = [Int]()
    
    var userData: UserDataViewController = UserDataViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.delegate = self
        historyTableView.dataSource = self
        self.historyTableView.allowsSelection = true
        self.historyTableView.allowsMultipleSelection = true
        self.historyTableView.allowsMultipleSelectionDuringEditing = true

      
      
        
        // Reload the table
        self.historyTableView.reloadData()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryFriendsCellView") as! HistoryFriendsCellViewTableViewCell
        
       
        
        cell.userName.text = names[indexPath.row]
        cell.amount.text = amt[indexPath.row]
        cell.amountFor.text = desc[indexPath.row]
   
        cell.userProfilePicture.layer.cornerRadius = cell.userProfilePicture.frame.size.width/2
        cell.userProfilePicture.clipsToBounds = true
        
        cell.userProfilePicture.image = userData.userProfile[indexPath.row]
        
        
        return cell
        
    }
    
   /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        var selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor(red:0.50, green:0.57, blue:1.00, alpha:1.0)
    }*/
    
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        let homestoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homecontroller = homestoryboard.instantiateViewController(withIdentifier:
            "HomeInitialController") as! HomeViewController
        self.present(homecontroller, animated: true, completion: nil)
        
        
        
    }
    
    
    

   }
