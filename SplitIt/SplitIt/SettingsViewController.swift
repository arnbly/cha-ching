//
//  SettingsViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    //UIButtons
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var userCurrencyButton: UIButton!
    
    // UILabels
    @IBOutlet weak var mainUserName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userCurrency: UILabel!
    
    
    /*
     var name = String()
     var email = String()
     var profilePicture = UIImage()
     */
    var curr = String()
    var edittedCurr = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         mainUserName.text = name
         userName.text = name
         userEmail.text = email
         userImage.image = profilePicture
         */
        
        
        userCurrency.text = "USD"
        edittedCurr = userCurrency.text!
        if curr != "" {
            userCurrency.text = curr
            edittedCurr = userCurrency.text!
        }
        
        
        self.userImage.layer.cornerRadius = self.userImage.frame.size.width/2
        self.userImage.clipsToBounds = true
        
        
        
        //custom fb sign out button
        view.addSubview(signOutButton)
        signOutButton.addTarget(self, action: #selector(handlesignOutButton), for: .touchUpInside)
        
        
        
        //Check to see if user has signed in
        ifUserIsLoggedIn()
        
        
        
    }
    
    func ifUserIsLoggedIn() {
        
        
        let user = FIRAuth.auth()?.currentUser
        // The user's ID, unique to the Firebase project.
        // Do NOT use this value to authenticate with your backend server,
        // if you have one. Use getTokenWithCompletion:completion: instead.
        
        let email = user?.email
        //let uid = user?.uid
        let photoURL = user?.photoURL
        let name = user?.displayName
        
        mainUserName.text = name
        userEmail.text = email
        
        let data = NSData(contentsOf: photoURL!)
        userImage.image = UIImage(data: data as! Data)
        
        print("Settings page displays the name as:", mainUserName.text)
        print("Settings page displays the email as:", userEmail.text)
        
        
    }
    
    
    
    func handlesignOutButton() {
        
        //Sign out of Firebase
        try! FIRAuth.auth()!.signOut()
        
        //Sign out of Facebook
        FBSDKAccessToken.setCurrent(nil)
        FBSDKProfile.setCurrent(nil)
        let manager = FBSDKLoginManager()
        manager.logOut()
        
        //Move user to the Main Storyboard
        let signinstoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signincontroller = signinstoryboard.instantiateViewController(withIdentifier: "SignInSB") as! SignInViewController
        self.present(signincontroller, animated: true, completion: nil)
    }
    
    
    
    @IBAction func didTapUserCurrencyEditButton(_ sender: UIButton) {
        
        let settingsstoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingscurrencycontroller = settingsstoryboard.instantiateViewController(withIdentifier:
            "SettingsCurrencyController") as! SettingsCurrencyViewController
        settingscurrencycontroller.currency = edittedCurr
        self.present(settingscurrencycontroller, animated: true, completion: nil)
        
        
        
    }
    
    
    @IBAction func didTapUserNameEditButton(_ sender: UIButton) {
        
        let settingsstoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsnamecontroller = settingsstoryboard.instantiateViewController(withIdentifier:
            "SettingsNameController") as! SettingsNameViewController
        settingsnamecontroller.namevalue = mainUserName.text!
        self.present(settingsnamecontroller, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func didTapUserEmailButton(_ sender: UIButton) {
        
        
        let settingsstoryboard = UIStoryboard(name: "Settings", bundle: nil)
        let settingsemailcontroller = settingsstoryboard.instantiateViewController(withIdentifier:
            "SettingsEmailController") as! SettingsEmailViewController
        settingsemailcontroller.emailvalue = userEmail.text!
        self.present(settingsemailcontroller, animated: true, completion: nil)
        
        
    }
    
}
