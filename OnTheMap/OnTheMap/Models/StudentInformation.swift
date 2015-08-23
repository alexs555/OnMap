//
//  Location.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 03/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import SwiftyJSON

struct StudentInformation {
    
    var objectId: String?
    var uniqKey: String?
    var firstName: String?
    var lastName: String?
    var mapString: String?
    var mediaUrl: String?
    var latitude: Double?
    var longitude: Double?
    
    init (json: JSON) {
        
        objectId = json["objectId"].string
        uniqKey = json["uniqKey"].string
        firstName = json["firstName"].string
        lastName = json["lastName"].string
        mapString = json["mapString"].string
        mediaUrl = json["mediaUrl"].string
        latitude = json["latitude"].double
        longitude = json["longitude"].double
        
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
