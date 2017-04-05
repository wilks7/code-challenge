//
//  Todo.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import Foundation

class Todo {
    
    let userId: Int
    let id: Int?
    let title: String
    let completed: Bool
    
    // initializer for object creation and empty objects
    init(userId: Int, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    // initializer for jsonObject
    init(dict: [String:AnyObject]) {
        
        if let userId = dict["userId"] as? Int {
            self.userId = userId
        } else { self.userId = 0 }
        
        if let id = dict["id"] as? Int {
            self.id = id
        } else { self.id = nil }
        
        if let title = dict["title"] as? String {
            self.title = title
        } else { self.title = "no-title" }
        
        if let completed = dict["completed"] as? Bool {
            self.completed = completed
        } else { self.completed = false }
    }
}
