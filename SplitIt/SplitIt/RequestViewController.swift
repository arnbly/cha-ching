//
//  RequestViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {

    @IBOutlet weak var lentField: UITextField!
    @IBOutlet weak var forField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination as! RequestWithViewController
        
        destinationViewController.text = lentField.text
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.alpha = 0
    }
    
    
    @IBAction func firstBackArrow(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didPressX(_ sender: Any) {
        // [1] Create a new "Storyboard2" instance.
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeSB") as UIViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func lentField(_ sender: Any) {
        if let text = lentField.text, !text.isEmpty || (forField.text != nil), !text.isEmpty
        {
            //do something if it's not empty
            UIView.animate(withDuration: 0.3, delay: 0.3, options: [.curveEaseIn], animations: {
                self.nextButton.alpha = 1
            }, completion: nil)
            
        }
    }
    

    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    

}
