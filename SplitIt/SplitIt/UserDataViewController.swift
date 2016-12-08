//
//  UserDataViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 12/7/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class UserDataViewController: UIViewController {

    //User Names - 14ct
    let userNames = [
        "Kristen Bailey",
        "Clare Corthell",
        "Henry Jewkes",
        "Matt Burghoffer",
        "Megan Charles",
        "Lauren Tindal",
        "Lauren Hegge",
        "James McDaniel",
        "Sini Matikainen",
        "Ryan Scruggs",
        "Camellia Neri",
        "Heather Phillips",
        "Derek Steer",
        "Lucas Smith"]
    
    //Split With Users - 3ct
    let splitNames = [
        "Me",
        "Matt Burghoffer",
        "Heather Phillips"]
    
    //Split With User Profiles 
    var splitProfile: [UIImage] = [
        UIImage(named: "m6.png")!,
        UIImage(named: "m2.png")!,
        UIImage(named: "f8.png")!
    ]
    
    //User Profile Photos
    var userProfile: [UIImage] = [
        UIImage(named: "f1.png")!,
        UIImage(named: "f2.png")!,
        UIImage(named: "m1.png")!,
        UIImage(named: "m2.png")!,
        UIImage(named: "f3.png")!,
        UIImage(named: "f4.png")!,
        UIImage(named: "f5.png")!,
        UIImage(named: "m3.png")!,
        UIImage(named: "f6.png")!,
        UIImage(named: "m4.png")!,
        UIImage(named: "f7.png")!,
        UIImage(named: "f8.png")!,
        UIImage(named: "m5.png")!,
        UIImage(named: "m6.png")!,
    ]
    
    //Transaction Amounts
    let transAmounts = [
        15.43,
        15.43,
        64.89,
        45.23,
        -12.43,
        56.67,
        56.67,
        -123.45,
        -65.73,
        -10.84,
        -31.23,
        43.50,
        -1503.23,
        -23.49]
    
    //Transaction Description
    let transDescriptions = [
        "Dinner",
        "Dinner",
        "Cocktails, and Utilities",
        "Show Tickets",
        "Lyft",
        "Tacos, Beers, and Tickets",
        "Tacos, Beers, and Tickets",
        "Suction Cups, Diamond Glass Cutter, and Stethoscope",
        "Raccoon Masks, and Black Sweaters",
        "Lockpicking Kit",
        "Art Supplies",
        "Mani Pedis",
        "Rent, House Supplies, Utilities, and Food for Apartment",
        "Office Supplies"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
