//
//  NotificationsViewController.swift
//  Facebook_HW
//
//  Created by Jason Demetillo on 9/6/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet var onScroll: UIScrollView!
    
    @IBOutlet var notifyView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notifyView.sizeToFit()
        onScroll.contentSize = CGSizeMake(notifyView.frame.width,notifyView.frame.height)
        
        // Do any additional setup after loading the view.
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
