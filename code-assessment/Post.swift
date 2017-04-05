//
//  Post.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import Foundation

class Post {
    
    let userId: Int
    let id: Int?
    let title: String
    let post: String
    
    // initializer for object creation and empty objects
    init(userId: Int, id: Int, title: String, post: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.post = post
    }
    
    // initializer for jsonObject
    init(dict: [String:AnyObject]){
        if let id = dict["id"] as? Int{
            self.id = id
        } else {self.id = nil}
        
        if let userId = dict["userId"] as? Int {
            self.userId = userId
        } else { self.userId = 0 }
        
        if let title = dict["title"] as? String{
            self.title = title
        } else { self.title = "unknown" }
        
        if let post = dict["body"] as? String{
            self.post = post
        } else { self.post = "unknown" }
    }
}
