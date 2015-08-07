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
    
    case SignIn( String, String)
    
    // MARK: URLRequestConvertible
    
        var method: Alamofire.Method {
            switch self {
                case .SignIn(let email, let password):
                    return .POST
                }
          
        }
        
        var path: String {
            switch self {

                case .SignIn(let email, let password):
                    return "/api/session"
                }

        }
            
        var URLRequest: NSURLRequest {
            
            let URL = NSURL(string: UdacityRouter.baseURLString)!
            let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
            mutableURLRequest.HTTPMethod = method.rawValue
            mutableURLRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            switch self {
                
                case .SignIn(let email, let password):
                    
                    println()
                    
                    return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: ["udacity": ["email": email, "password":  password]]).0
                default:
                    return mutableURLRequest
            }
            
        }

}

// MARK: - Parse API Support

/*public enum ParseAPI {
    
    case Locations(limit: Int)
}

extension ParseAPI : MoyaPath {
    
    public var path: String {
        
        switch (self) {
        case .Locations:
            return "/1/classes/StudentLocation"
        }
    }
}


extension ParseAPI : MoyaTarget {
    
    public var base: String { return "https://api.parse.com" }
    public var baseURL: NSURL { return NSURL(string: base)! }
    
    public var parameters: [String: AnyObject] {
        switch self {
            
        case .Locations(let limit):
            return ["order": "-updatedAt","limit":limit]
        default:
            return [:]
        }
    }
    
    public var method: Moya.Method {
        switch self {
            
        case .Locations(let limit):
            return .GET
        default:
            return .GET
        }
    }
    
    public var sampleData: NSData {
        
        return NSData()
    }
    
}

// MARK: - Udacity API Support

public enum UdacityAPI {
    
    case SignIn(email: String, password: String)
    
}

extension UdacityAPI : MoyaPath {
    
    public var path: String {
        
        switch (self) {
        case .SignIn:
            return "/api/session"
        }
    }
}


extension UdacityAPI : MoyaTarget {
    
    public var base: String { return "https://www.udacity.com" }
    public var baseURL: NSURL { return NSURL(string: base)! }
    
    public var parameters: [String: AnyObject] {
        switch self {
            
            case .SignIn(let email, let password):
                return ["udacity": ["email": email, "password":  password]]
            default:
                return [:]
            }
    }
    
    public var method: Moya.Method {
        switch self {
            
        case .SignIn(let email, let password):
            return .GET
        default:
            return .GET
        }
    }
    
    public var sampleData: NSData {
     
        return NSData()
    }

}


public class ParseProvider<T where T: MoyaTarget>: MoyaProvider<T> {
    
      public init(endpointsClosure: MoyaEndpointsClosure = MoyaProvider.DefaultEndpointMapping(),  networkActivityClosure: Moya.NetworkActivityClosure? = nil) {

                super.init(endpointsClosure:endpointsClosure)
        }
}

public struct Provider {
    private static var endpointsClosure = { (target: ParseAPI) -> Endpoint<ParseAPI> in
        
        var endpoint: Endpoint<ParseAPI> = Endpoint<ParseAPI>(URL: url(target), sampleResponse: .Success(200, {target.sampleData}), method: target.method, parameters: target.parameters)

            return endpoint.endpointByAddingHTTPHeaderFields(["X-Xapp-Token": ""])
        
    }
    
    public static func DefaultProvider() -> ParseProvider<ParseAPI> {
        return ParseProvider(endpointsClosure: endpointsClosure)
    }
    

    private struct SharedProvider {
        static var instance = Provider.DefaultProvider()
    }
    
    public static var sharedProvider: ParseProvider<ParseAPI> {
        get {
            return SharedProvider.instance
        }
        
        set (newSharedProvider) {
            SharedProvider.instance = newSharedProvider
        }
    }
}

public func url(route: MoyaTarget) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString!
}*/