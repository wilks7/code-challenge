//
//  TodosTableViewController.swift
//  code-assessment
//
//  Created by Michael Wilkowski on 4/4/17.
//  Copyright © 2017 JustWilks. All rights reserved.
//

import UIKit

class TodosTableViewController: UITableViewController {

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.sharedController.todos.count // if network error there will be one dummy object
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)

        let todo = Singleton.sharedController.todos[indexPath.row]
        
        cell.textLabel?.text = todo.title
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    // MARK: Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todoDetail" {
            let detailVC = segue.destination as! TodoDetailViewController
            if let selectedIndex = self.tableView.indexPathForSelectedRow {
                let todo = Singleton.sharedController.todos[selectedIndex.row]
                detailVC.todo = todo
            }
        }
    }
}
