//
//  ReminderCell.swift
//  RemaindersApp
//
//  Created by Dainis Putans on 13/05/2020.
//  Copyright © 2020 Dainis Putans. All rights reserved.
//

import UIKit

class ReminderCell: UITableViewCell {
    
    @IBOutlet weak var isCompletedView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var infoButton: UIButton!
    
    func update(reminder: Reminder, index: Int) {
        
        titleLabel.text = reminder.title
        
        infoButton.tag = index
        
        // dinamicaly changes corner radius
        isCompletedView.layer.cornerRadius = isCompletedView.frame.size.width / 2.0
        // creating border color of circle
        isCompletedView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy hh:mma"
        dateLabel.text = dateFormatter.string(from: reminder.date)
        
        if reminder.isCompleted {
            isCompletedView.backgroundColor = UIColor.green
            // isCompletedView doesn't display any border
            isCompletedView.layer.borderWidth = 0.0
        } else {
            isCompletedView.backgroundColor = UIColor.white
            isCompletedView.layer.borderWidth = 2.0
        }
    }
}
