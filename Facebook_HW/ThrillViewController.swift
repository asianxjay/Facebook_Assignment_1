//
//  ThrillViewController.swift
//  Facebook_HW
//
//  Created by Jason Demetillo on 9/6/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class ThrillViewController: UIViewController, UIGestureRecognizerDelegate {
    

    @IBOutlet var commentField: UITextField!
    @IBOutlet var onScroll: UIScrollView!
    @IBOutlet var commentView: UIView!
    @IBOutlet var thrillView: UIImageView!
    @IBAction func onDismiss(sender: AnyObject) {
    
    dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBAction func onTap(sender: AnyObject) {
            view.endEditing(true)
    }
    
    @IBAction func onComment(sender: AnyObject) {
        commentField.becomeFirstResponder()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thrillView.sizeToFit()
        onScroll.contentSize = CGSizeMake(thrillView.frame.width,thrillView.frame.height)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        onScroll.contentInset.top = 0
        onScroll.contentInset.bottom = 0
        onScroll.scrollIndicatorInsets.top = 0
        onScroll.scrollIndicatorInsets.bottom = 0
        
        onScroll.sendSubviewToBack(thrillView)
        
        
        func keyboardWillShow(notification: NSNotification!) {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
            var userInfo = notification.userInfo!
            
            var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
            var animationCurve = curveValue.integerValue
                
                // Set view properties in here that you want to match with the animation of the keyboard
                // If you need it, you can use the kbSize property above to get the keyboard width and height.
                UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
                    self.thrillView.frame.origin.y = self.view.frame.size.height - kbSize.height - self.thrillView.frame.size.height
                
                
                }, completion: nil)
        }
        
        func keyboardWillHide(notification: NSNotification!) {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
            var userInfo = notification.userInfo!
            
            var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
            var animationCurve = curveValue.integerValue
                
                // Set view properties in here that you want to match with the animation of the keyboard
                // If you need it, you can use the kbSize property above to get the keyboard width and height.
            UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
                    self.thrillView.frame.origin.y = self.onScroll.frame.size.height + self.onScroll.frame.origin.y
 
                }, completion: nil)
            
        }
        

    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
