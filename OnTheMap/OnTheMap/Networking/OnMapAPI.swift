//
//  OnMapAPI.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import Foundation
import Moya
import Alamofire


enum UdacityRouter: URLRequestConvertible {
    
    static let baseURLString = "https://www.udacity.com"
    
   //static let baseURLString = "https://api.github.com"
    
    case SignIn( String, String),Logout
    
    // MARK: URLRequestConvertible
    
        var method: Alamofire.Method {
            switch self {
                case .SignIn(let email, let password):
                    return .POST
                case .Logout:
                    return .DELETE
            }
          
        }
        
        var path: String {
            return "/api/session"
            
        }
            
        var URLRequest: NSURLRequest {
            
            let URL = NSURL(string: UdacityRouter.baseURLString)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
            mutableURLRequest.HTTPMethod = method.rawValue
            mutableURLRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            switch self {
                
                case .SignIn(let email, let password):
                    
                    return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: ["udacity": ["username": email, "password":  password]]).0
                case .Logout:
                
                    var xsrfCookie: NSHTTPCookie? = nil
                    let sharedCookieStorage = NSHTTPCookieStorage.sharedHTTPCookieStorage()
                    for cookie in sharedCookieStorage.cookies as! [NSHTTPCookie] {
                        if cookie.name == "XSRF-TOKEN" { xsrfCookie = cookie }
                    }
                    if let xsrfCookie = xsrfCookie {
                        mutableURLRequest.setValue(xsrfCookie.value!, forHTTPHeaderField: "X-XSRF-TOKEN")
                    }
                    return mutableURLRequest;
                
                default:
                    return mutableURLRequest
            }
            
        }

}

// MARK: - Parse API Support

enum ParseRouter : URLRequestConvertible {
    
    static let baseURLString = "https://api.parse.com/1/classes"
    
    case Locations, CreateLocation
    
    var method: Alamofire.Method {
        
        switch self {
            
            case .Locations:
                return .GET
            default:
                return .GET
        }
    }
    
    var path: String {
        return "/StudentLocation"
        
    }
    
    var URLRequest: NSURLRequest {
        
        let URL = NSURL(string: ParseRouter.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        mutableURLRequest.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
        mutableURLRequest.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")
        switch self {
            
            case .Locations:
            
            //return mutableURLRequest
                return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: ["limit":100,"order":"-updatedAt"]).0
            default:
                return mutableURLRequest
        }
        
    }
    
    
}