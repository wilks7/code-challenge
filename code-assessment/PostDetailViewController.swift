//
//  PostDetailViewController.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    var post: Post?
    var authorUser: User?
    
    @IBOutlet var idOutlet: UILabel!
    @IBOutlet var titleOutlet: UILabel!
    @IBOutlet var postOutlet: UITextView!
    @IBOutlet var uidButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let post = post else {return}
        if let id = post.id { idOutlet.text = String(id) }
        titleOutlet.text = post.title
        postOutlet.text = post.post
        
        guard let user = Singleton.sharedController.uidToUser(uid: post.userId)
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
