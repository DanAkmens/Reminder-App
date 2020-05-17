//
//  NewReminderViewController.swift
//  RemaindersApp
//
//  Created by Dainis Putans on 14/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

class NewReminderViewController: UIViewController {
    var reminderIndex: Int?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var completedSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let reminderIndex = reminderIndex {
            let reminder = ReminderService.shared.getReminder(index: reminderIndex)
            // populate our outlets
            titleTextField.text = reminder.title
            datePicker.date = reminder.date
            completedSwitch.isOn = reminder.isCompleted
        }
    }
    
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        // Create a reminder object
        let reminder = Reminder(title: titleTextField.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        // Update a reminder
        if let reminderIndex = reminderIndex {
            ReminderService.shared.update(reminder: reminder, index: reminderIndex)
        // else, create a new reminder
        } else {
            ReminderService.shared.create(reminder: reminder)
        }
        
        navigationController!.popViewController(animated: true)
    }
}
