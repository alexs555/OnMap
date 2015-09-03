//
//  ListViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentsStorage.sharedInstance.studentCount()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if let info = StudentsStorage.sharedInstance.studentForIndexPath(indexPath) {
            cell.textLabel?.text = info.firstName! + " " + info.lastName!
        }
        
        cell.imageView?.image = UIImage(named: "pin")
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let info = StudentsStorage.sharedInstance.studentForIndexPath(indexPath) {
            if let stringUrl = info.mediaUrl {
               var url = NSURL(string: stringUrl)
               UIApplication.sharedApplication().openURL(url!)
            }
        }
    }
    
}
