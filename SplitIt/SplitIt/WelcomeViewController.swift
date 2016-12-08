//
//  WelcomeViewController.swift
//  SplitIt
//
//  Created by Aaron Bailey on 11/28/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//
import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeScrollView.contentSize = CGSize (width: 1500, height: 667)
        welcomeScrollView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        //let originalCenter = viewOne.center
        let scrollIncrement = 375 as CGFloat
        
        if welcomeScrollView.contentOffset.x < 1125 {
            UIView.animate(withDuration: 0.3, animations: {
                self.welcomeScrollView.contentOffset.x = self.welcomeScrollView.contentOffset.x + scrollIncrement
                
                // Get the current page based on the scroll offset
                let page : Int = Int(round(self.welcomeScrollView.contentOffset.x / 375))
                
                // Set the current page, so the dots will update
                UIView.animate(withDuration: 0.3, animations: {
                    self.pageControl.currentPage = page
                })
                if self.welcomeScrollView.contentOffset.x >= 1125 {
                    self.nextButton.alpha = 0
                }
            })// end animation block
        } //end if else
    }// End nextTapped Method
    
    @IBAction func startTapped(_ sender: UIButton) {
        // [1] Create a new "Home" instance.
        let homestoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        // [2] Create an instance of the storyboard's initial view controller.
        let controller = homestoryboard.instantiateViewController(withIdentifier: "HomeInitialController") as UIViewController
        
        // [3] Display the new view controller.
        present(controller, animated: true, completion: nil)
        
    }// End startTapped Method
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(welcomeScrollView.contentOffset.x / 375))
        
        // Set the current page, so the dots will update
        UIView.animate(withDuration: 0.3, animations: {
            self.pageControl.currentPage = page
        })
    }//End scrollViewDidEndDecelarating
}
