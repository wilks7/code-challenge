//
//  User.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import Foundation

class User {
    
    let id: Int?
    let name: String
    let username: String
    let email: String
    let address: NSDictionary
    let company: [String:String]
    let website: String
    let phone: String
    
    // initializer for object creation and empty objects
    init(id: Int, name: String, username: String, email: String, address: NSDictionary, company: [String:String], website: String, phone: String) {
        
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.company = company
        self.website = website
        self.phone = phone
    }
    
    // initializer for jsonObject
    init(dict: [String:AnyObject]) {
        
        if let id = dict["id"] as? Int {
            self.id = id
        } else { self.id = nil }
        
        if let name = dict["name"] as? String {
            self.name = name
        } else { self.name = "unknown" }
        
        if let username = dict["username"] as? String {
            self.username = username
        } else { username = "unknown" }
        
        if let email = dict["email"] as? String {
            self.email = email
        } else { self.email = "none" }
        
        if let website = dict["website"] as? String {
            self.website = website
        } else { self.website = "none" }
        
        if let phone = dict["phone"] as? String {
            self.phone = phone
        } else { self.phone = "none" }
        
        if let address = dict["address"] as? NSDictionary {
            self.address = address
        } else { self.address = ["None":"None"] }
        
        if let company = dict["company"] as? [String:String] {
            self.company = company
        } else { self.company = ["None":"None"] }
    }
}
