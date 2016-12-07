//
//  PayToViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class PayToViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var totalLabel: UILabel!
    var text: String!
    @IBOutlet weak var tableView: UITableView!
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var selected = String()
    
    let recents = ["Aaron Bailey", "Lauren Tindal", "Charlie Codepath", "Emmeline Kim", "Amrutha Krishnan", "Alex Watson", "Andrea Tovar", "Lisa Johnson", "Linda Thompson", "Laura Lee"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        totalLabel.text = text
        
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
        let array = (recents as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! PayReviewViewController
        
        destinationViewController.text = totalLabel.text
        
    }
    
    @IBAction func didPressX(_ sender: Any) {
        // [1] Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeSB") as UIViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.resultSearchController.isActive) {
            return self.filteredTableData.count
        }
        else {
            return self.recents.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewFriendsCell") as! NewFriendsCell
        let recent = recents[indexPath.row]
        //cell.userName.text = recents[indexPath.row]
        //return cell
        
        if (self.resultSearchController.isActive) {
            cell.userName.text = filteredTableData[indexPath.row]
            return cell
        }
        else {
            cell.userName.text = recents[indexPath.row]
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        var selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.red
        }
    
    
    @IBAction func didPressBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    


}
