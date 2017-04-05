//
//  TodoDetailViewController.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//
import Foundation
import UIKit

class TodoDetailViewController: UIViewController {

    var todo: Todo?
    var authorUser: User?
    
    @IBOutlet var uidButtonOutlet: UIButton!
    @IBOutlet var idOutlet: UILabel!
    @IBOutlet var titleOutlet: UILabel!
    @IBOutlet var completedOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let todo = todo else {return}
        
        if let id = todo.id {
            idOutlet.text = "\(id)"
        }
        titleOutlet.text = todo.title
        
        if todo.completed {
            completedOutlet.text = "Complete"
            completedOutlet.textColor = .green
        } else {
            completedOutlet.text = "Incomplete"
            completedOutlet.textColor = .red
        }

        guard let user = Singleton.sharedController.uidToUser(uid: todo.userId)
            else { // disable the button if no authorUser found
                uidButtonOutlet.isEnabled = false
                return
        }
        self.authorUser = user
        uidButtonOutlet.setTitle(user.name, for: .normal)
        uidButtonOutlet.roundButton()
        
    }
    
    // MARK: Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! UserDetailViewController
        guard let user = authorUser else {return}
        detailVC.user = user
    }
}
