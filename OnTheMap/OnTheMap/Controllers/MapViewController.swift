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
        
        loadStudents()
        
    }
    
    func loadStudents() {
        
        showOverlayView()
        Alamofire.request(ParseRouter.Locations).responseJSON() { (request, response, resultJSON, error) in
            
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
                if (self.studentsInfoArray?.count > 0) {
                    self.placePins()
                    StudentsStorage.sharedInstance.addStudents(self.studentsInfoArray!)
                } else {
                    self.clear()
                }
                
            }
            
        }

    }
    
    func clear() {
        
        StudentsStorage.sharedInstance.clear()
        
        let userAnnotation = mapView.userLocation;
        mapView.removeAnnotations(mapView.annotations)
        if (userAnnotation != nil) {
            mapView.addAnnotation(userAnnotation)
        }
    }
    
    func placePins() {
        
        for  studentInfo: StudentInformation in studentsInfoArray! {
            
                let location = CLLocationCoordinate2DMake(studentInfo.latitude!,studentInfo.longitude!)
                let dropPin = MKPointAnnotation()
                dropPin.coordinate = location
                dropPin.title = studentInfo.firstName
                dropPin.subtitle = studentInfo.mediaUrl
                mapView.addAnnotation(dropPin)
            }
        
        }
    
      
}
