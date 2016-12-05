//
//  OweViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class OweViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var youOweTotalDetaiLabel: UILabel!
    @IBOutlet weak var owedPeopleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cellView: owedTableViewCell!
    
    //init swipe to pay/clear variables
    var cellOriginalCenter: CGPoint!
    var cellOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanCell(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let firstStep: CGFloat = 65
        let secondStep: CGFloat = 200
        let firstNStep: CGFloat = -65
        let secondNStep: CGFloat = -200
        
        if sender.state == .began {
            print("began")
            
            // #### ASSIGN cellView TO ACTUAL titleView??
            //Initalize Image Positions
            cellOriginalCenter = cellView.center
            
        } else if sender.state == .changed {
            
            print("changed")
            
            cellView.center = CGPoint(x: cellOriginalCenter.x + translation.x, y: cellOriginalCenter.y)
            
            if translation.x > firstStep && translation.x < secondStep {
                //Record Cash Payment - Purple
                // #### FIX COLOR ####
                view.backgroundColor = UIColor.init(red: 68/255, green: 213/255, blue: 25/255, alpha: 1)
                
                //Fade in Archive Icon
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.archiveIcon.alpha = 1
//                })
                
//                //Hide later icon for clear
//                laterIcon.alpha = 0
//                
//                //Move Icon
//                archiveIcon.center = CGPoint(x: cellView.center.x - 217, y: archiveIconOriginal.y)
//                
//                //Swap Image back to archive icon
//                archiveIcon.image = UIImage(named: "archive_icon")
                
                
            } else if translation.x < firstNStep && translation.x > secondNStep {
                //Venmo Payment - Green
                // #### FIX COLOR ####
                view.backgroundColor = UIColor.init(red: 255/255, green: 218/255, blue: 39/255, alpha: 1)
                
//                //Fade in Later Icon
//                UIView.animate(withDuration: 0.2, animations: {
//                    self.laterIcon.alpha = 1
//                })
//                
//                //Hide Archive icon for clear
//                archiveIcon.alpha = 0
//                
//                //Move Icon
//                laterIcon.center = CGPoint(x: cellView.center.x + 217, y: laterIconOriginal.y)
//                
//                //Swap Image back to later
//                laterIcon.image = UIImage(named: "later_icon")
                
            } else {
                view.backgroundColor = UIColor.lightGray
                
                //Re-instate opacity of icons
//                archiveIcon.alpha = 0.7
//                laterIcon.alpha = 0.7
            } // End ElseIf animation of background tile
            
        //Animate cell out or back in based on position
        } else if sender.state == .ended {
            print("ended")
            
            if translation.x > 75 {
                print("Clear Message Right")
                //Clear Message Right
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                               animations: { () -> Void in
                                //code
                                self.cellView.center = CGPoint(x: self.cellOriginalCenter.x + 375, y: self.cellOriginalCenter.y)
                                
                                // ##### FIX ####
                                //Hide Archive icon for clear
//                                self.archiveIcon.alpha = 0
//                                self.laterIcon.alpha = 0
                }, completion: nil)
                
            } else if translation.x > secondNStep && translation.x < firstNStep {
                // ##### FIX ####
                //                //Show List View
//                UIView.animate(withDuration: 0.4, animations: {
//                    self.listView.alpha = 1
//                })
//                
                print("Clear Message Left")
            } else {
                //Return Message to center
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                //code
                                self.cellView.center = self.cellOriginalCenter
                }, completion: nil)
            }//End Clear or return cell ElseIf statement
        }//End Pan ElseIF Statement
    }// End didPanCell
    
    @IBAction func payAllTapped(_ sender: Any) {
    
    }// End payAllTapped Method
    
    @IBAction func backTapped(_ sender: Any) {
    
    
    }// End backTapped Method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        // ##### FIX ME #####
        return 5
    }// End tableView Method - For Setup
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "owedTableViewCell") as! owedTableViewCell

        // ##### FIX ME #####
//        if let text = message["text"] as? String {
//            cell.chatLabel.text = text
//        }
        
        return cell
    }// End tableView Method - For Setup
}
