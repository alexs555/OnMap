//
//  UsersStorage.swift
//  OnTheMap
//
//  Created by Алексей Шпирко on 23/08/15.
//  Copyright (c) 2015 AlexShpirko LLC. All rights reserved.
//

import Foundation

class StudentsStorage {
    
    static let sharedInstance = StudentsStorage()
    
    private var studentsArray:[StudentInformation] = []
    
    func addStudents(students:[StudentInformation]!) {
        
        studentsArray = students
        studentsArray.sort({ $0.firstName < $1.firstName })
    }
    
    func studentCount() -> Int {
        
        return studentsArray.count
    }
    
    func studentForIndexPath(indexPath:NSIndexPath) -> StudentInformation? {
        
        return studentsArray[indexPath.row]
    }
    
    func clear() {
        studentsArray.removeAll(keepCapacity: false)
    }
    
}
