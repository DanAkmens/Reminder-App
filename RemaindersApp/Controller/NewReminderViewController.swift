//
//  NewReminderViewController.swift
//  RemaindersApp
//
//  Created by Dainis Putans on 14/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

class NewReminderViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var completedSwitch: UISwitch!
    
    
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        // Create a reminder object
        let reminder = Reminder(title: titleTextField.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        
        ReminderService.shared.create(reminder: reminder)
        
        navigationController!.popViewController(animated: true)
    }
}
