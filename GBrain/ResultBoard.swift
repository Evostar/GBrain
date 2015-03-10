//
//  ResultBoard.swift
//  ConvertGreatBrain
//
//  Created by davidforlove on 12/16/14.
//  Copyright (c) 2014 davidforlove. All rights reserved.
//

import UIKit
import Social

class ResultBoard: UIViewController{
    
   
    
    @IBOutlet weak var scoreResult: UILabel!
    
    
    @IBAction func returnButton() {
        
       // self.dismissViewControllerAnimated(true, completion: nil)
      
      //  scoreResult.text = String(score)
        
        
        
    }
    @IBAction func faceBookButton(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            
            
            var FacebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            FacebookSheet.setInitialText("I am playing Great Brain，my score is \(score)!")
            
            
            self.presentViewController(FacebookSheet, animated: true, completion: nil)
            
            
        } else {
            
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            
            
        }
        
        
        
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        scoreResult.text = String(score)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
       // scoreResult.text = scoreString!

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
