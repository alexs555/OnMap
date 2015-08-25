//
//  BaseContentViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import Alamofire

class BaseViewController: UIViewController {
    
    var activityTag = 555
    var studentsInfoArray : Array<StudentInformation>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeNavigationBar()
    }
    
    private func customizeNavigationBar() {
        
        var button: UIButton = UIButton()
        button.setImage(UIImage(named: "pin"), forState: .Normal)
        button.frame = CGRectMake(0, 0, 45, 45)
        button.addTarget( self, action: "showInformation", forControlEvents: UIControlEvents.TouchUpInside)
        
        var placeLocation:UIBarButtonItem = UIBarButtonItem()
        placeLocation.customView = button
        
        var refresh = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: "refresh")
        navigationItem.rightBarButtonItems = [refresh,placeLocation]
    }

    func showOverlayView() {
        
        var activity = UIActivityIndicatorView(frame: CGRectMake(0, 0, 25, 25))
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activity.startAnimating()
        activity.center = view.center
        activity.tag = activityTag
        view.addSubview(activity)
        
    }
    
    func hideOverlay() {
        
        view.viewWithTag(activityTag)?.removeFromSuperview()
    }
    
    @IBAction func logout(sender: UIBarButtonItem) {
        
        Alamofire.request(UdacityRouter.Logout).response { (request, response, data, error)  in

            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
        }
    }
    
    func showAlertWithText(text:String) {
        
        var alert = UIAlertController(title: "Error", message: text, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func refresh() {
        
        //override in subclasses
    }
    
    func showInformation() {
        
        performSegueWithIdentifier("showInformation", sender: self)
    }

}
