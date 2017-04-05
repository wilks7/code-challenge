//
//  PostsTableViewController.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.sharedController.posts.count // if network error there will be one dummy object
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)

        let post = Singleton.sharedController.posts[indexPath.row]
        
        cell.textLabel?.text = post.title
        cell.textLabel?.textColor = .white

        return cell
    }
    
    // MARK: Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postdetail" {
            let detailVC = segue.destination as! PostDetailViewController
            if let selectedIndex = self.tableView.indexPathForSelectedRow {
                let post = Singleton.sharedController.posts[selectedIndex.row]
                detailVC.post = post
            }
        }
    }
}
