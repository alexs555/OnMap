//
//  CurrentUser.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 25/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import Foundation


class CurrentUser {
    
    static let sharedInstance = CurrentUser()
    
    private(set) var lastName:String?
    private(set) var firstName:String?
    private(set) var userId:String?
    
    func updateWithFirstName(firstName:String?, lastName:String?, userId:String?) {
        
        self.lastName = lastName != nil ? lastName : ""
        self.firstName = firstName != nil ? firstName : ""
        self.userId = userId != nil ? userId : ""
    }
    
}
