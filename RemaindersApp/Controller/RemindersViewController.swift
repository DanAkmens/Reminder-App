//
//  RemindersViewController.swift
//  RemaindersApp
//
//  Created by Dainis Putans on 13/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

class RemindersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // this method will call data source methods below in order to refresh itself
        tableview.reloadData()
    }
    
    @IBAction func editButtonDidPressed(_ sender: UIBarButtonItem) {
        if tableview.isEditing  {
            sender.title = "Edit"
            tableview.isEditing = false
        } else {
            sender.title = "Done"
            tableview.isEditing = true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // If user wants to delete a cell
        if editingStyle == .delete {
            ReminderService.shared.delete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReminderService.shared.toggleCompleted(index: indexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderService.shared.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue the cell from reuse pool
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell") as! ReminderCell
        
        // Get the reminder for the given index path
        let reminder = ReminderService.shared.getReminder(index: indexPath.row)
        
        // Update the cell base on the reminder object
        cell.update(reminder: reminder, index: indexPath.row)
        
        // Return cell
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // identifier -> string we set in storyboard
        // destination -> references the view controller we're transitioning into
        if segue.identifier == "UpdateSegue", let newReminderViewController = segue.destination as? NewReminderViewController, let infoButton = sender as? UIButton {
            
            newReminderViewController.reminderIndex = infoButton.tag
        }
    }
}
