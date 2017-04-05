//
//  NetworkController.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import Foundation
import UIKit

class NetworkController {
    
    static let baseUrl = "http://jsonplaceholder.typicode.com/"
    
    static func getPosts(completion:@escaping(_ : [Post]?, _ error: NSError?)->Void) {
        
        let urlStr = baseUrl + "posts"
        let url = URL(string: urlStr)
        
        var request = URLRequest(url:url!) // in this case the url is always valid
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil { // escape if there is an error
                print(String(describing: error))
                completion(nil, error as NSError?)
                return
            }
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as? AnyObject {
                    
                    if let dictArray = jsonObject as? [[String:AnyObject]] {
                        var allPosts = [Post]()
                        for item in dictArray {
                            let post = Post(dict: item)
                            allPosts.append(post)
                        }
                        completion(allPosts, nil)
                    }
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(nil, error)
            }
            
        }); task.resume()
    }
    
    static func getUsers(completion:@escaping(_ : [User]?, _ error: NSError?)->Void) {
        
        let urlStr = baseUrl + "users"
        let url = URL(string: urlStr)
        
        var request = URLRequest(url:url!) // the url is valid in this case
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil { // error check before handle
                print(String(describing: error))
                completion(nil, error as NSError?)
                return
            }
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as? AnyObject {
                    
                    if let dictArray = jsonObject as? [[String:AnyObject]] {
                        var allUsers = [User]()
                        for item in dictArray {
                            let user = User(dict: item)
                            allUsers.append(user)
                        }
                        completion(allUsers, nil)
                    }
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(nil, error)
            }
            
        }); task.resume()
    }
    
    static func getTodos(completion:@escaping(_ : [Todo]?, _ error: NSError?)->Void) {
        
        let urlStr = baseUrl + "todos"
        let url = URL(string: urlStr)
        
        var request = URLRequest(url:url!) // url will always be valid
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            if error != nil { // check for errors first
                print(String(describing: error))
                completion(nil, error as NSError?)
                return
            }
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data!, options: []) as? AnyObject {
                    
                    if let dictArray = jsonObject as? [[String:AnyObject]] {
                        var allTodos = [Todo]()
                        for item in dictArray {
                            let todo = Todo(dict: item)
                            allTodos.append(todo)
                        }
                        completion(allTodos, nil)
                    }
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(nil, error)
            }
            
        }); task.resume()
    }
}
