//
//  UserLocationController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 23/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import SwiftyJSON

class UserLocationController: BaseViewController, UITextFieldDelegate {
    @IBOutlet weak var mapView: MKMapView!

    var placeMark:CLPlacemark?
    var usersLink:String?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizeTextField()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UITextView.appearance().tintColor = UIColor.whiteColor()
        
        mapView.addAnnotation(MKPlacemark(placemark: placeMark))
        let coordinates = placeMark?.location.coordinate
        if let location = placeMark?.location {
          centerMapOnLocation(location)
        }
        
    }
    
    func customizeTextField() {
        
        UITextField.appearance().tintColor = UIColor.whiteColor()
        let string = NSMutableAttributedString(string: "Enter a Link to Share here")
        string.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, string.length))
        string.addAttribute(NSFontAttributeName, value:UIFont(name: "HelveticaNeue", size: 20)!, range: NSMakeRange(0, string.length))
        textField.attributedPlaceholder = string
        textField.textColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let regionRadius: CLLocationDistance = 500
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    @IBAction func dismiss(sender: AnyObject) {
        
        let vc = presentingViewController
        dismissViewControllerAnimated(true, completion: {
            vc?.dismissViewControllerAnimated(false, completion: nil)
        })
    }
    @IBAction func submit(sender: AnyObject) {
        
        if (textField.text.isEmpty) {
            self.showAlertWithText("Enter a link to share, please!")
            return;
        }
        
       showOverlayView()
       Alamofire.request(ParseRouter.CreateLocation(placeMark!.name!, textField.text, mapView.region.center)).responseJSON(options:NSJSONReadingOptions.AllowFragments , completionHandler: { (request, response, jsonResponse, error) in
        
               self.hideOverlay()
        
               let result = JSON(jsonResponse!)
        
               if (result["error"].string != nil) {
                    self.showAlertWithText(result["error"].string!)
               } else {
                    self.dismiss(self)
            }
        
       })
        
    }
    
    // MARK: - TextField delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }


}
