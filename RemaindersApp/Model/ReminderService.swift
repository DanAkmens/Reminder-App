//
//  ReminderService.swift
//  RemaindersApp
//
//  Created by Dainis Putans on 12/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import Foundation

// data processing

class ReminderService {
    
    static let shared = ReminderService()
    
    private var reminders = [Reminder]()
    
    // create reminder
    func create(reminder: Reminder) {
        // Add reminder to reminders array ina sorted order
        var indexToInsert: Int?
        for (index, element) in reminders.enumerated() {
            // element date - 02/01/2020
            // reminder date - 01/01/2020
            if element.date.timeIntervalSince1970 > reminder.date.timeIntervalSince1970  {
                print(element.date.timeIntervalSince1970)
                print(reminder.date.timeIntervalSince1970)
                indexToInsert = index
                break
            }
        }
        // if we have indexToInsert, then we use it
        if let indexToInsert = indexToInsert {
            reminders.insert(reminder, at: indexToInsert)
        } else {
            reminders.append(reminder)
        }
    }
    
    // Update reminder
    func update(reminder: Reminder, index: Int) {
        
        reminders[index] = reminder
    }
    
    // Get update # of reminders
    func getCount() -> Int {
        return reminders.count
    }
    
    // Get a specific reminder
    func getReminder(index: Int) -> Reminder {
        return reminders[index]
    }
    
    // Toggle completed status of a reminder
    func toggleCompleted(index: Int) {
        let reminder = getReminder(index: index)
        reminder.isCompleted = !reminder.isCompleted
    }
    
    // Get the list of reminders
    func getReminders() -> [Reminder] {
        return reminders
    }
    
    // Delete a reminder
    func delete(index: Int) {
        reminders.remove(at: index)
    }
    
    // Get the favoritedReminder
    func getFavoritedReminder() -> Reminder? {
        return reminders.first
    }
    
}
