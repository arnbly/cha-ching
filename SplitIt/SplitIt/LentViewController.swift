//
//  LentViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class LentViewController: UIViewController, UITableViewDataSource {
    
    var userData: UserDataViewController = UserDataViewController()
    
    @IBOutlet weak var lentLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var userNames = [String]()
    var userProfile = [UIImage]()
    var transAmounts = [Double]()
    var transDescriptions = [String]()
    
    var lentTransAmounts = [Double]()
    let formatter = NumberFormatter()
    
    var arrayCount = 0 as Int
    var lentAmount = Double()
    
    var cellOriginalCenter: CGPoint!
    //var feedOriginalCenter: CGPoint!
    var laterIconOriginal: CGPoint!
    var archiveIconOriginal: CGPoint!
    
    var messageOffset: CGFloat!
    
    let greenColor = UIColor(red: 85/255, green: 229/255, blue: 179/255, alpha: 1)
    let purpleColor = UIColor(red: 127/255, green: 146/255, blue: 255/255, alpha: 1)
    let grayColor = UIColor(red: 214/255, green: 216/255, blue: 219/255, alpha: 1)
    let redColor = UIColor(red: 255/255, green: 140/255, blue: 127/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
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
        }
        
        formatter.numberStyle = .currency
        
        lentLabel.text = formatter.string(from: lentAmount as NSNumber)
        countLabel.text = "To " + String(arrayCount) + " people"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lentTableCell") as! LentTableViewCell
        
        formatter.numberStyle = .currency
        
        let userName = userNames[indexPath.row]
        let userImage = userProfile[indexPath.row]
        let transaction = lentTransAmounts[indexPath.row]
        let description = transDescriptions[indexPath.row]
        
        cell.userNameLabel.text = userName
        cell.profileImage.image = userImage
        cell.transAmountLabel.text = formatter.string(from: transaction as NSNumber)
        cell.transDescriptionLabel.text = description
        
        //Add and enable pan on new view
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        cell.isUserInteractionEnabled = true
        cell.addGestureRecognizer(panGestureRecognizer)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //update page header
        lentAmount = lentAmount - lentTransAmounts[indexPath.row]
        arrayCount -= 1
        lentLabel.text = formatter.string(from: lentAmount as NSNumber)
        countLabel.text = "To " + String(arrayCount) + " people"
        
        //remove data from array
        self.userNames.remove(at: indexPath.row)
        self.userProfile.remove(at: indexPath.row)
        self.lentTransAmounts.remove(at: indexPath.row)
        self.transDescriptions.remove(at: indexPath.row)
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    
    func didPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let cell = sender.view as! LentTableViewCell
        let translateObject = cell.tileView as! UIView
        
        let firstStep: CGFloat = 65
        let secondStep: CGFloat = -65
        
        if sender.state == .began {
            print("Gesture began")
            
            
            cellOriginalCenter = cell.center
            print(cellOriginalCenter)
        } else if sender.state == .changed {
            translateObject.center = CGPoint(x: cellOriginalCenter.x + translation.x, y: 45)
            
            if translation.x > firstStep {
                //Archive - Green
                cell.cellBackground.backgroundColor = purpleColor
                
            } else if translation.x < secondStep {
                cell.cellBackground.backgroundColor = greenColor
                
            } else if translation.x < 25 || translation.x > -25 {
                cell.cellBackground.backgroundColor = UIColor.lightGray
            }
            
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if translation.x > 75 {
                print("Clear Message Right")
                
                //Clear Message Right
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                               animations: { () -> Void in
                                //code
                                translateObject.center = CGPoint(x: self.cellOriginalCenter.x + 375, y: 45)
                                //Hide Archive icon for clear
                                cell.checkIcon.alpha = 0
                }, completion: nil)
                
                //Animate Scroll View Up
                UIView.animate(withDuration: 0.4, delay: 0.4, animations: {
                    print("Need to call clear view")
                    
                    //self.lentAmount = self.lentAmount - Double(cell.transAmountLabel.text!)!
                    self.arrayCount -= 1
                    self.lentLabel.text = self.formatter.string(from: self.lentAmount as NSNumber)
                    self.countLabel.text = "To " + String(self.arrayCount) + " people"
                    
                    let temp = cell.userNameLabel.text! as String
                    let arrayLoc = self.userNames.index(of: temp)
                    
                    //remove data from array
                    self.userNames.remove(at: arrayLoc!)
                    self.userProfile.remove(at: arrayLoc!)
                    self.lentTransAmounts.remove(at: arrayLoc!)
                    self.transDescriptions.remove(at: arrayLoc!)
                    
                    //cell.
                    
                    self.tableView.reloadData()
                })
                
            } else if translation.x < -75 {
                //Clear Message Right
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                               animations: { () -> Void in
                                //code
                                translateObject.center = CGPoint(x: self.cellOriginalCenter.x - 375, y: 45)
                                //Hide Archive icon for clear
                                cell.cashIcon.alpha = 0
                }, completion: nil)
                
            } else if translation.x > -75 && translation.x < 75 {
                //Show List View
                
                UIView.animate(withDuration: 0.4, animations: {
                    translateObject.center = CGPoint(x: self.cellOriginalCenter.x, y: 45)
                })
            }
        }
    }
}

