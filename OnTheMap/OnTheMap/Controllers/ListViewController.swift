//
//  ListViewController.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 02/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
   
   // @IBAction func logout(sender: UIBarButtonItem) {
    //}
    
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
    
    
}
