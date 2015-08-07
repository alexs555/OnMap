//
//  Location.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 03/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import Foundation


struct Location {
    
    var objectId: String?
    var uniqKey: String?
    var firstName: String?
    var lastName: String?
    var mapString: String?
    var mediaUrl: String?
    var latitude: Float?
    var longitude: Float?
    
    init (json: Dictionary<String,String>) {
        
        objectId = json["objectId"]
        uniqKey = json["uniqKey"]
        firstName = json["firstName"]
        lastName = json["lastName"]
        mapString = json["mapString"]
        mediaUrl = json["mediaUrl"]
        latitude = json["latitude"]?.floatValue
        longitude = json["longitude"]?.floatValue
        
    }
}

extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
