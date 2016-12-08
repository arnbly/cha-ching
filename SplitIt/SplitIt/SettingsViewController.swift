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
import FirebaseAuth
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
    @IBOutlet weak var userName: UILabel!
    
    
    var curr = String()
    var edittedCurr = String()
    
    var fadeTransition: FadeTransition!
    
    
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
            print("Settings curr:", curr )
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
        
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            
            let user = FIRAuth.auth()?.currentUser
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            let email = user?.email
            let name = user?.displayName
            let photoURL = user?.photoURL
          
            let data = NSData(contentsOf: photoURL!)
            userImage.image = UIImage(data: data as! Data)
            
            mainUserName.text = name
            userName.text = name
            userEmail.text = email
            
            
            
            print(mainUserName.text)
            print ("SUCCESS ON SETTINGS WITH USER DATA")
            
            // Get a reference to the storage service, using the default Firebase App
            let storage = FIRStorage.storage()
            
            // Create a storage reference from our storage service
            let storageRef = storage.reference(forURL: "gs://splitit-bb5bc.appspot.com")
            
            
            let profilePic = FBSDKGraphRequest(graphPath: "me/picture", parameters: ["height":300, "width": 300, "redirect": false], httpMethod: "GET")
            
            let connection = FBSDKGraphRequestConnection()
            
            connection.add(profilePic, completionHandler: { (connection, result, error) in
                
                if error != nil {
                    
                    print("Error on Setting Page with FBSDKGraph Request:", error)
                    
                } else {
                    
                    print("Settings Page FBSDKGraph Request Result:", result)
                    
                    
                    let dictionary = result as! NSDictionary
                    let data = dictionary.object(forKey: "data") as AnyObject?
                    
                    let urlPic = (data?.object(forKey: "url")) as! String
                    
                    if let imageData = NSData(contentsOf: NSURL(string: urlPic) as! URL){
                      
                        let profilePicRef = storageRef.child((user?.uid)!+"/profile_pic.jpg")
                        
                        let uploadTask = profilePicRef.put(imageData as! Data, metadata: nil){
                           metadata,error in
                            
                            if error == nil {
                                let downloadURL = metadata?.downloadURL()
                                
                            }else {
                                print("Download Image Error")
                                
                            }
                        }
                        self.userImage.image = UIImage(data: imageData as Data)
                    }
                    
                    
                }
                
            })
            
            connection.start()
            
            
            
        } else {
            // No user is signed in.
            
        }
    }
    
    
    
    func handlesignOutButton() {
        
        //Sign out of Firebase
        // try! FIRAuth.auth()!.signOut()
        
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
        /*
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransition
        transition.subtype = kCATransitionFromBottom
        view.window!.layer.add(transition, forKey: kCATransition)
        */
        self.present(settingscurrencycontroller, animated: true, completion: nil)
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingscurrencycontroller = segue.destination as! SettingsCurrencyViewController
        
        settingscurrencycontroller.modalPresentationStyle = .custom
        settingscurrencycontroller.transitioningDelegate = fadeTransition
       // fadeTransition.duration = 2 as! TimeInterval
        
        settingscurrencycontroller.currency = edittedCurr
        
    }
    */
    
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
    
    
    
    
   /* @IBAction func didTapPhoneButton(_ sender: Any) {
        
        print("PHONE")
        
        
    }*/
    
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
    
        let homestoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homecontroller = homestoryboard.instantiateViewController(withIdentifier:
            "HomeInitialController") as! HomeViewController
               self.present(homecontroller, animated: true, completion: nil)
    
    }
    
}
