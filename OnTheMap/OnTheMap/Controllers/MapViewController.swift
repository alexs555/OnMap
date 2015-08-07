//
//  MapViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit
import Moya

class MapViewController: BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
     /*   var endpointsClosure = { (target: ParseAPI) -> Endpoint<ParseAPI> in
            
            var endpoint: Endpoint<ParseAPI> = Endpoint<ParseAPI>(URL: url(target), sampleResponse: .Success(200, {target.sampleData}), method: target.method, parameters: target.parameters)
            
            return endpoint.endpointByAddingHTTPHeaderFields(["X-Parse-Application-Id": "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr","X-Parse-REST-API-Key":"QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"])
            
        }*/
        
        /*let ParseProvider = MoyaProvider<ParseAPI>(endpointsClosure:endpointsClosure ,networkActivityClosure:{ (change: Moya.NetworkActivityChangeType) -> () in
            
            switch (change) {
            case .Began:
                self.showOverlayView()
            case .Ended:
                self.hideOverlay()
            }
            
        })*/
        
       /* ParseProvider.request(.Locations(limit:100)){ (data, statusCode, response, error) in
            if let data = data {
                // do something with the data
                ParseProvider.mapCollection(Location.self, data: data)
                println(NSString(data: data, encoding: NSUTF8StringEncoding))
                
            }
        }*/
        
    
    }

}
