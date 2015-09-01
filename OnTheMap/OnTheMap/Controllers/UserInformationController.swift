//
//  UserInformationController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 23/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class UserInformationController: BaseViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeTextField()
        
    }
    
    func customizeTextField() {
        
        UITextField.appearance().tintColor = UIColor.whiteColor()
        let string = NSMutableAttributedString(string: "Enter your location here")
        string.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, string.length))
        string.addAttribute(NSFontAttributeName, value:UIFont(name: "HelveticaNeue", size: 20)!, range: NSMakeRange(0, string.length))
        textField.attributedPlaceholder = string
        textField.textColor = UIColor.whiteColor()
    }
    
    @IBAction func findPressed(sender: AnyObject) {
        showOverlayView()
        geocode(textField.text)
    }
    @IBAction func dismiss(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    
    func geocode(location:String) {
        
        showOverlayView()
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location, completionHandler: {(placemarks: [AnyObject]!, error: NSError!) -> Void in
            
            self.hideOverlay()
            if let placemark = placemarks?[0] as? CLPlacemark {
                self.performSegueWithIdentifier("showMap", sender: placemark)
            } else {
                self.showAlertWithText("Geocodig failed!")
            }
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showMap") {
            
            let placeMark = sender as? CLPlacemark
            let mapVC = segue.destinationViewController as! UserLocationController
            mapVC.placeMark = placeMark
            
            }
        }

}

