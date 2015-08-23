//
//  MapViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import SwiftyJSON
import MapKit

class MapViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showOverlayView()
        Alamofire.request(ParseRouter.Locations).responseJSON(options: NSJSONReadingOptions.AllowFragments) { (request, response, resultJSON, error) in
            
            self.hideOverlay()
            
            if (error != nil) {
                self.showAlertWithText("Loading failed")
                return
            }
            
            if (resultJSON != nil) {
                
                let results = JSON(resultJSON!)["results"]
                
                self.studentsInfoArray = results.array?.map {
                    
                    (var studentJsonInfo) -> StudentInformation in
                    var info = StudentInformation(json:studentJsonInfo)
                    return info
                    
                }
                self.placePins()
                
                println(self.studentsInfoArray)
            }
            
        }
    
    }
    
    func placePins() {
        
        for  studentInfo: StudentInformation in studentsInfoArray! {
            
                let location = CLLocationCoordinate2DMake(studentInfo.latitude!,studentInfo.longitude!)
                let dropPin = MKPointAnnotation()
                dropPin.coordinate = location
                dropPin.title = studentInfo.firstName
                mapView.addAnnotation(dropPin)
            }
        
        }
    
      
}
