//
//  AppConstants.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 3/29/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import Foundation
import UIKit

let themeColor = UIColor(colorLiteralRed: 32/255.0, green: 66/255.0, blue: 162/255.0, alpha: 1.0)

// User Default Keys
let questionIndexKey = "questionIndexKey"


// Saved Responses

//TODO: Separate into type of question

let questionnaireCompletedKey = "questionnaireCompletedKey"

let userNameKey     = "userNameKey"
let userAgeKey      = "userAgeKey"
let userWeightKey   = "userWeightKey"
let userGenderKey   = "userGenderKey"

let question1Response = "question1ResponseKey"
let question2Response = "question2ResponseKey"
let question3Response = "question3ResponseKey"
let question4Response = "question4ResponseKey"
let question5Response = "question5ResponseKey"
let question6Response = "question6ResponseKey"
let question7Response = "question7ResponseKey"
let question8Response = "question8ResponseKey"
let question9Response = "question9ResponseKey"
let question10Response = "question10ResponseKey"
let question11Response = "question11ResponseKey"
let question12Response = "question12ResponseKey"
let question13Response = "question13ResponseKey"
let question14Response = "question14ResponseKey"
let question15Response = "question15ResponseKey"
let question16Response = "question16ResponseKey"
let question17Response = "question17ResponseKey"
let question18Response = "question18ResponseKey"
let question19Response = "question19ResponseKey"
let question20Response = "question20ResponseKey"
let question21Response = "question21ResponseKey"
let question22Response = "question22ResponseKey"
let question23Response = "question23ResponseKey"
let question24Response = "question24ResponseKey"
let question25Response = "question25ResponseKey"
let question26Response = "question26ResponseKey"
let question27Response = "question27ResponseKey"
let question28Response = "question28ResponseKey"
let question29Response = "question29ResponseKey"
let question30Response = "question30ResponseKey"
let question31Response = "question31ResponseKey"
let question32Response = "question32ResponseKey"
let question33Response = "question33ResponseKey"
let question34Response = "question34ResponseKey"
let question35Response = "question35ResponseKey"
let question36Response = "question36ResponseKey"
let question37Response = "question37ResponseKey"
let question38Response = "question38ResponseKey"
let question39Response = "question39ResponseKey"
let question40Response = "question40ResponseKey"


// MARK: ---Swift Extensions---

// MARK: Date extension for calculating the difference between dates.
extension Date {
    
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
    
    func humanReadable() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        return dateFormatter.string(from: self)
    }
}
