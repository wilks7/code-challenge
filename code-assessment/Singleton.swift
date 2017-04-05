//
//  Singleton.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import Foundation
import UIKit

class Singleton {
    
    var users: [User] = []
    
    var todos: [Todo] = []
    
    var posts: [Post] = []
    
    static let sharedController = Singleton()
    
    func uidToUser(uid: Int) -> User? {
        for user in self.users {
            if let id = user.id {
                if id == uid {
                    return user
                }
            }
        }
        return nil
    }
    
    func countPosts(uid: Int)->Int{
        var count = 0
        for p in self.posts {
            if p.userId == uid {
                count += 1
            }
        }
        return count
    }
    
    func fetchData(completion:@escaping(_ allComplete: Bool)->Void) {
        
        let group = DispatchGroup()
        
        
        group.enter()
        NetworkController.getPosts { (posts, error) in
            if (error != nil) {
                let noPost = Post(userId: 0, id: 0, title: "No Posts", post: "Theres seems to be no posts or there was a network error collecting the posts")
                self.posts.append(noPost)
                group.leave()
            } else {
                if let posts = posts {
                    for p in posts {
                        self.posts.append(p)
                    }
                    group.leave()
                }
            }
        }
        
        
        group.enter()
        NetworkController.getTodos { (todos, error) in
            if (error != nil) { // if theres an error print it and pass a "noUser"
                let noTodo = Todo(userId: 0, id: 0, title: "No Todos", completed: false)
                self.todos.append(noTodo)
                group.leave()
            } else {
                if let todos = todos {
                    for t in todos {
                        self.todos.append(t)
                    }
                    group.leave()
                }
            }
        }
        
        group.enter()
        NetworkController.getUsers { (users, error) in
            if (error != nil) { // if theres an error print it and pass a "noUser"
                let noUser = User(id: 0, name: "No Users", username: "", email: "", address: [:], company: [:], website: "", phone: "")
                self.users.append(noUser)
                group.leave()
            } else {
                if let users = users {
                    for u in users {
                        self.users.append(u)
                    }
                    group.leave()
                }
            }
        }
        
        group.notify(queue: DispatchQueue.main) {
            completion(true)
        } // if anything needs done for photo caching
    }
}
extension UIButton {
    
    func roundButton(){
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 5
    }
}
