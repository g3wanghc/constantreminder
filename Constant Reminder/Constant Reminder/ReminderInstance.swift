//
//  ReminderInstance.swift
//  Constant Reminder
//
//  Created by Hanchen Wang on 2016-01-27.
//  Copyright © 2016 Asian Social Rejects. All rights reserved.
//

import UIKit

class ReminderInstance {
    
    // MARL: Constants
    let colours: [String] = ["Red", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet"]
    let priorities: [String] = ["Minor", "Major", "Critical"]
    
    // MARK: Properties
    var title: String
    var description: String
    
    var created_date: NSDate
    var due_date: NSDate
    
    var priority: Int
    var colour: Int
    
    var completed: Bool
    var completed_date: NSDate
    
    var notification: Bool
    var notification_frequency: Double // Minutes
    var last_notification: NSDate
    
    var expired: Bool
    
    init(
        title: String = "",
        description: String = "",
        created_date: NSDate = NSDate(),
        // 3 days later due date by default
        due_date: NSDate = NSDate().dateByAddingTimeInterval(60*60*24*3),
        priority: Int = 1,
        colour: Int = 0,
        completed: Bool = false,
        completed_date: NSDate = NSDate(),
        notification: Bool = true,
        // 4 hours notification cycle by default
        notification_frequency: Double = 4*60,
        last_notification: NSDate = NSDate(),
        expired: Bool = false
    )
    {
        
        // title is truncated to 60 char
        self.title = title.substringToIndex(title.startIndex.advancedBy(60))
        // description is truncated to 250 char
        self.description = description.substringToIndex(title.startIndex.advancedBy(250))
        self.created_date = created_date
        // due date has to be greater than the created date
        if (due_date.compare(NSDate()) == NSComparisonResult.OrderedDescending){
            self.due_date = due_date
            self.expired = false
        } else {
            self.due_date = NSDate()
            self.expired = true
        }
        // color and priority has to be within range ([0:2], [0,6])
        self.priority = ((priority > 2) || (priority < 0)) ? 0 : priority
        self.colour = ((priority > 6) || (priority < 0)) ? 0 : colour
        self.completed = completed
        self.completed_date = completed_date
        self.notification = notification
        self.notification_frequency = notification_frequency
        self.last_notification = last_notification
    }
    
    func timeLeft()-> NSTimeInterval {
        return NSDate().timeIntervalSinceDate(self.due_date)
    }
    
    
    func shouldNotify() -> Bool {
        // is the last time you notify plus the waiting period no later than the current time?
        return last_notification.dateByAddingTimeInterval(60*self.notification_frequency).compare(
            NSDate()) != NSComparisonResult.OrderedDescending
    }
    
    func isExpired() -> Bool {
        if (self.expired){
            return self.expired
        }
        if(NSDate().compare(self.due_date) != NSComparisonResult.OrderedAscending ) {
            self.expired = true
        }
        // false
        return self.expired
    }
}
    