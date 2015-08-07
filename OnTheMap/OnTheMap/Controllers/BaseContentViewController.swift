//
//  BaseContentViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var activityTag = 555

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

}
