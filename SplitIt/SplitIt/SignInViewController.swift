//
//  SignInViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseDatabase

class SignInViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    @IBOutlet weak var customFBButton: UIButton!
    
    var pictureURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Deafult FB Login Button (below) hidden
        let loginButton = FBSDKLoginButton()
        /*view.addSubview(loginButton)*/
        loginButton.frame = CGRect(x: 50, y: 480, width: view.frame.width-100, height: 50)
        loginButton.delegate = self
        loginButton.readPermissions = ["email","public_profile","user_friends"]
        
        
        //Custom FB login button
        view.addSubview(customFBButton)
        customFBButton.addTarget(self, action: #selector(handleCustomFBLogin), for: .touchUpInside)
        
        
        //Firebase get the currently signed in user
        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
            if user != nil {
                //User is signed in
            } else {
                //No user is signed in
            }
        })
    }
    
    func handleCustomFBLogin() {
        
        FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self) {
            (result, err) in
            if err != nil {
                print("FB Login Failed",err)
                return
            }
            self.showEmailAddress()
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did Log out of Facebook")
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print("Error")
            return
        }
        showEmailAddress()
    }
    
    
    func showEmailAddress(){
        
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else {return}
        let credentials = FIRFacebookAuthProvider.credential(withAccessToken: accessTokenString)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                print ("Something went wrong", error)
                return
            }
            print("Success with FIR", user)
            let ref = FIRDatabase.database().reference(fromURL: "https://splititfirebase.firebaseio.com/")
            
            // Guard for user id
            guard let uid = user?.uid else {
                return
            }
            
            // Create a child reference - uid will let us wrap each users data in a unique user id for later reference
            let usersReference = ref.child("users").child(uid)
            
            FBSDKGraphRequest(graphPath: "/me", parameters:
                ["fields": "id, name, email, picture.type(large)"]).start { (connection, result, err) in
                    
                    if err != nil {
                        print("Failed to start Graph Request", err)
                        return
                    }
                    else {
                        if let dataDict = result as? [String:AnyObject] {
                            
                            
                            // Photo URL code
                            let picture = dataDict["picture"] as? [String:AnyObject]
                            let data = picture?["data"] as? NSDictionary
                            let URL = data?["url"] as? String
                            let pictureURL = NSURL(string: URL!)
                            let imageData = NSData(contentsOf: pictureURL as! URL)
                            let profileImage = UIImage(data: imageData as! Data)
                            
                            
                            // Name code
                            let username = dataDict["name"]
                            var name = String()
                            name = username as! String
                            
                            // Email code
                            let useremail = dataDict["email"]
                            var email = String()
                            email = useremail as! String
                            
                            var profilePictureURL = String()
                            profilePictureURL = URL!
                            
                            /*
                             var userCurrency = String()
                             userCurrency = "USD"
                             */
                            
                            print("User Name is: \(username)")
                            print("User Email is: \(useremail)")
                            print("User Image URL is: \(pictureURL)")
                            
                            
                            
                            let values = ["displayName": name, "email": email, "photoURL": profilePictureURL] as [String : Any]
                            
                            
                            
                            //Update our databse by using the child database reference above called usersReference
                            usersReference.setValue(values, withCompletionBlock: { (err, ref) in
                                
                                if err != nil {
                                    print(err)
                                    return
                                }
                                
                                
                                
                                print(ref)
                                
                                print("Save the user successfully into Firebase database")
                            })
                            
                            
                            
                            
                            //Passing data to Settings View Controller
                            
                            let settingsstoryboard = UIStoryboard(name: "Settings", bundle: nil)
                            let settingscontroller = settingsstoryboard.instantiateViewController(withIdentifier: "SettingsInitialController") as! SettingsViewController
                            
                            //  settingscontroller.name = username as! String
                            // settingscontroller.email = useremail as! String
                            // settingscontroller.profilePicture = profileImage!
                            
                            self.present(settingscontroller, animated: true, completion: nil)
                            
                            
                            
                        }
                        
                        print (result)
                        
                    }
            }
        })
        
        //   self.performSegue(withIdentifier: "welcomePageSegue", sender: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
