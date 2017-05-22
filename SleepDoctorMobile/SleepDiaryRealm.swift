//
//  SleepDiaryRealm.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/21/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit
import RealmSwift

class SleepDiaryRealm: NSObject {

    // This class will be responsible for archiving the sleep diary entries and all that.
    
    // Write the updated entries to the database
    
    func updateDiary(withDiary:SleepDiary) {
        // TODO: Do Realm stuff to access and update the sleep diary.
        
        // Get the default Realm
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                var sleepDiary = realm.objects(SleepDiary.self).first
                
                if let diary = sleepDiary {

                    // Diary already exists, overwrite it.
                    try! realm.write {
                        sleepDiary = withDiary
                    }
                    
                } else {
                    
                    // Create a new
                    try! realm.write {
                        realm.add(withDiary)
                    }
                }
            }
        }
    }
    
    func getCurrentDiary() -> SleepDiary? {
        let realm = try! Realm()
        // TODO: Consider changing this query to return only active sleep diary by adding a search predicate
        let sleepDiary = realm.objects(SleepDiary.self).first
        
        if let diary = sleepDiary {
            // Found a diary object
            if (diary.isActive) {
                return diary
            } else {
                print("There's no active diary!")
                return nil
            }
        } else {
            // Didn't find a diary object, will need to create a new one (user will decide to start diary).
            return nil
        }
    }
}

class DiaryEntry:Object {
    // Dates to record when user fell asleep/woke up and got in/out of bed
    dynamic var gotInBedTime:NSDate    = NSDate.init()
    dynamic var fellAsleepTime:NSDate  = NSDate.init()
    dynamic var wokeUpTime:NSDate      = NSDate.init()
    dynamic var gotOutOfBedTime:NSDate = NSDate.init()
    
    // A value from 0-2, meaning the number of times the user woke up at night.
    dynamic var numberOfDisturbances   = 0
    
    // General variables to track the date of the entry in the sleep diary and index in diary
    dynamic var date:NSDate = NSDate.init()  // Records the date of the entry (init'd to the day the user fell asleep)
    dynamic var index:Int   = 0              // Ranges from 0-13 (14 total days in the diary
}

class SleepDiary:Object {
    dynamic var startDate:NSDate = NSDate.init()
    dynamic var isActive:Bool   = false
    let UID:String?              = "1234567890"
    var entries = List<DiaryEntry>()
}
