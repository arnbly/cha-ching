//
//  RequestWithViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RequestWithViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var totalLabel: UILabel!
    var text: String!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

     var userData: UserDataViewController = UserDataViewController()
    
    //User Profile Photos
    /*var userProfile: [UIImage] = [
        UIImage(named: "m7.png")!,
        UIImage(named: "f2.png")!,
        UIImage(named: "m1.png")!,
        UIImage(named: "f1.png")!,
        UIImage(named: "f3.png")!,
        UIImage(named: "m3.png")!,
        UIImage(named: "f5.png")!,
        UIImage(named: "f4.png")!,
        UIImage(named: "f6.png")!,
        UIImage(named: "f7.png")!,
        ]*/
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var checked = [Bool]()
    var selected = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Formats input as dollars
        let convertStrtoInt = Int(text)
        let myNumber = convertStrtoInt!
            
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        totalLabel.text = formatter.string(from: myNumber as NSNumber)

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.allowsSelection = true
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        if #available(iOS 9.0, *) {
            self.resultSearchController.loadViewIfNeeded()// iOS 9
        } else {
            // Fallback on earlier versions
            let _ = self.resultSearchController.view          // iOS 8
        }
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.tintColor = UIColor(red:0.64, green:0.64, blue:0.90, alpha:1.0)
            controller.searchBar.barTintColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            
            self.tableView.tableHeaderView = controller.searchBar
            
            controller.searchBar.placeholder = "Search for friends"
            controller.searchBar.sizeToFit()

            
            return controller
        })()
        
        // Reload the table
        self.tableView.reloadData()
        

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        filteredTableData.removeAll(keepingCapacity: false)
        
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (userData.userNames as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! RequestSplitViewController
        
        destinationViewController.text = totalLabel.text
        
    }
   
    @IBAction func didPressX(_ sender: Any) {
        // [1] Create a new "Storyboard" instance.
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeInitialController") as UIViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func backArrow(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.isActive) {
            return self.filteredTableData.count
        }
        else {
            return self.userData.userNames.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell") as! FriendsCell
        //let recent = recents[indexPath.row]
        //let userImage = userProfile[indexPath.row]
        
        if (self.resultSearchController.isActive) {
            cell.label.text = filteredTableData[indexPath.row]
            cell.selectDefault.isHidden = false
            cell.selectActive.isHidden = true
            return cell
        }
        else {
            cell.label.text = userData.userNames[indexPath.row]
            cell.profileImage.image = userData.userProfile[indexPath.row]
            cell.selectDefault.isHidden = false
            cell.selectActive.isHidden = true

            return cell
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        var selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor(red:0.50, green:0.57, blue:1.00, alpha:1.0)
    }
    
    
    @IBAction func didTap(_ sender: Any) {
        view.endEditing(true)
    }

}


