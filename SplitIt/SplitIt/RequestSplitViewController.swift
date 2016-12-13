//
//  RequestSplitViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RequestSplitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var lentTotal: UILabel!
    var text: String!
    let names = ["Aaron Bailey", "Amrutha Krishnan", "Lauren Tindal"]
    
    var userData: UserDataViewController = UserDataViewController()
    
    //User Profile Photos
    /*var userProfile: [UIImage] = [
        UIImage(named: "m7.png")!,
        UIImage(named: "f2.png")!,
        UIImage(named: "f1.png")!,
        ]*/
    
    var digits = [Int]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var evenlyButton: UIButton!
    @IBOutlet weak var customButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView2.isHidden = true
        tableView2.delegate = self
        tableView2.dataSource = self
        
        lentTotal.text = text
    }
    
    
    @IBAction func didPressEven(_ sender: Any) {
        tableView.isHidden = false
        tableView2.isHidden = true
        evenlyButton.isSelected = true
        customButton.isSelected = false
    }
    
    @IBAction func didPressCustom(_ sender: Any) {
        tableView.isHidden = true
        tableView2.isHidden = false
        evenlyButton.isSelected = false
        customButton.isSelected = true
    }
    
    @IBAction func backArrow(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func didPressX(_ sender: Any)  {
            // [1] Create a new "Storyboard2" instance.
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            
            // [2] Create an instance of the storyboard's initial view controller.
            let controller = storyboard.instantiateViewController(withIdentifier: "HomeInitialController") as UIViewController
            
            // [3] Display the new view controller.
            present(controller, animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let totalPay = Int(lentTotal.text!) ?? 0
        let payments = totalPay/(names.count)
        let userPayment = String(describing: payments)
        var cell:UITableViewCell?
        let name = names[indexPath.row]
        //let userImage = userProfile[indexPath.row]
        
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTable") as! CustomTableViewCell
            cell.userName.text = userData.splitNames[indexPath.row]
            cell.userPhoto.image = userData.splitProfile[indexPath.row]
            cell.userPayment.text = userPayment
            return cell
            
        }
        
        if tableView == self.tableView2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewTable") as! NewTableViewCell
            cell.userName.text = userData.splitNames[indexPath.row]
            cell.profileImage.image = userData.splitProfile[indexPath.row]
            return cell
            
            let text = cell.userPayment.text!
            for element in text.characters
            {
                digits.append(Int(String(element))!)
            }

        }
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! RequestReviewViewController
        
        destinationViewController.text = lentTotal.text

    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }


    

}
