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
    
    var text: String!
    let names = ["Kristen Bailey", "Lauren Tindal"]
    let desc = ["Paid for Dinner, 12/13/16", "Dinner","Dinner and Drinks","Lunch","Grocery"]
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryFriendsTableViewCell
        
        cell.userName.text = names[indexPath.row]
        cell.payAmount.text = amt[indexPath.row]
        cell.amountFor.text = desc[indexPath.row]
        
        cell.profilePicture.layer.cornerRadius = cell.profilePicture.frame.size.width/2
        cell.profilePicture.clipsToBounds = true
        
        cell.profilePicture.image = userData.userProfile[indexPath.row]
        
        
        return cell
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        let homestoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homecontroller = homestoryboard.instantiateViewController(withIdentifier:
            "HomeInitialController") as! HomeViewController
        self.present(homecontroller, animated: true, completion: nil)
    
    }

    

}
