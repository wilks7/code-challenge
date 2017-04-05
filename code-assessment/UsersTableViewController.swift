//
//  UsersTableViewController.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        Singleton.sharedController.fetchData { (allComplete) in
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.sharedController.users.count // if network error there will be one dummy object
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)

        let user = Singleton.sharedController.users[indexPath.row]
        
        cell.textLabel?.text = user.name
        cell.textLabel?.textColor = .white

        return cell
    }
    
    
    // MARK: Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userdetail" {
            let detailVC = segue.destination as! UserDetailViewController
            if let selectedIndex = self.tableView.indexPathForSelectedRow {
                let user = Singleton.sharedController.users[selectedIndex.row]
                detailVC.user = user
            }
        }
    }
}
