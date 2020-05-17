//
//  Reminder.swift
//  RemaindersApp
//
//  Created by Dainis Putans on 12/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import Foundation

// data storage
class Reminder: Codable {
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(title: String, date: Date, isCompleted: Bool) {
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
