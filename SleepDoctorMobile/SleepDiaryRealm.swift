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
    
    func createNewDiary() -> SleepDiary {
        // create a new diary object.
        let newDiary = SleepDiary()
        let secondsInDay = 60*60*24
        // Add 14 diary entries to it, initializing their indices
        for i in 0...13 {
            let diaryEntry = DiaryEntry()
            // Set the entry index
            diaryEntry.index = i
            // Init the entry date
            diaryEntry.date  = NSDate(timeIntervalSinceNow: TimeInterval(i*secondsInDay))
            
            // Give some initial values to the wake up/sleep dates
            diaryEntry.gotInBedTime    = diaryEntry.date
            diaryEntry.fellAsleepTime  = diaryEntry.date
            diaryEntry.wokeUpTime      = NSDate.init(timeInterval: Double(secondsInDay), since: diaryEntry.date as Date)
            diaryEntry.gotOutOfBedTime = NSDate.init(timeInterval: Double(secondsInDay), since: diaryEntry.date as Date)            
            
            /*
            gotInBedTimePicker.setDate(diaryEntry?.date as! Date, animated: true)
            fellAsleepTimePicker.setDate(diaryEntry?.date as! Date, animated: true)
            wokeUpTimePicker.setDate(Date.init(timeInterval: Double(secondsInDay), since: diaryEntry?.date as! Date), animated: true)
            gotOutOfBedTimePicker.setDate(Date.init(timeInterval: Double(secondsInDay), since: diaryEntry?.date as! Date), animated: true)
            */
            
            
            // Add the entry to the new diary
            newDiary.entries.append(diaryEntry)
        }
        newDiary.isActive = true
        // Get the default realm
        let realm = try! Realm()
        
        // Persist the data
        try! realm.write {
            realm.add(newDiary)
        }
        // Return the newly initalized diary
        return newDiary
    }
    
    func updateDiary(withDiary:SleepDiary) {
        // Need to create a new diary object, which will then replace the old one.
        var updatedDiary = SleepDiary()
        updatedDiary.entries = withDiary.entries
        updatedDiary.id      = withDiary.id
        updatedDiary.isActive = withDiary.isActive
        updatedDiary.startDate = withDiary.startDate
        
        // Get the default Realm
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                // If diary already exists, overwrite it (Realm automatically overwrites if primary
                //      keys are matching).
                try! realm.write {
                    realm.add(updatedDiary, update:true)
                }
            }
        }
    }
    
    func updateEntry(withEntry:DiaryEntry) {
        
        // Realm requires you to do this to update the entry.
        /* This now happens in the VC
        var updatedEntry = DiaryEntry()
        updatedEntry.date = withEntry.date
        updatedEntry.fellAsleepTime = withEntry.fellAsleepTime
        updatedEntry.gotInBedTime   = withEntry.gotInBedTime
        updatedEntry.gotOutOfBedTime = withEntry.gotOutOfBedTime
        updatedEntry.id             = withEntry.id
        updatedEntry.index          = withEntry.index
        updatedEntry.numberOfDisturbances = withEntry.numberOfDisturbances
        updatedEntry.wokeUpTime     = withEntry.wokeUpTime
        updatedEntry.minutesAsleep  = withEntry.minutesAsleep
        updatedEntry.sleepEfficiency = withEntry.sleepEfficiency
        */
        
        // Get the default Realm
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                    // Update the diary entry if it already exists (it should always exist). Realm
                    //      automatically overwrites objects if the primary keys are matching.
                try! realm.write {
                    realm.add(withEntry, update: true)
                }
            }
        }
    }

    
    func getCurrentDiary() -> SleepDiary? {
        let realm = try! Realm()
        // TODO: Consider changing this query to return only active sleep diary by adding a search predicate
        let sleepDiaryList = realm.objects(SleepDiary.self).filter("isActive == true")
        let activeDiary = sleepDiaryList.first
        
        if let diary = activeDiary {
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
    
    func getEntry(forDiary: SleepDiary, withIndex: Int) {
        // Might now actually be necessary
    }
}

class DiaryEntry:Object {
    // Dates to record when user fell asleep/woke up and got in/out of bed
    dynamic var gotInBedTime:NSDate    = NSDate.init()
    dynamic var fellAsleepTime:NSDate  = NSDate.init()
    dynamic var wokeUpTime:NSDate      = NSDate.init()
    dynamic var gotOutOfBedTime:NSDate = NSDate.init()
    
    // Calculated variables based on the inputted dates.
    dynamic var sleepEfficiency:Float  = 0.0
    dynamic var minutesAsleep    = 0
    
    // The primary key used to identify the database entry
    dynamic var id = NSUUID().uuidString
    
    // A value from 0-2, meaning the number of times the user woke up at night.
    dynamic var numberOfDisturbances   = 0
    
    // General variables to track the date of the entry in the sleep diary and index in diary
    dynamic var date:NSDate = NSDate.init()  // Records the date of the entry (init'd to the day the user fell asleep)
    dynamic var index:Int   = 0              // Ranges from 0-13 (14 total days in the diary
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class SleepDiary:Object {
    dynamic var startDate:NSDate = NSDate.init()
    dynamic var isActive:Bool   = false
    dynamic var id = NSUUID().uuidString
    var entries = List<DiaryEntry>()

    
    override static func primaryKey() -> String? {
        return "id"
    }
}
