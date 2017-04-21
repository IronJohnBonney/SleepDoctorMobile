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
        let sleepDiary = realm.objects(SleepDiary.self).first
        
        if let diary = sleepDiary {
            // Found a diary object
            return diary
        } else {
            // Didn't find a diary object, will need to create a new one.
            return nil
        }
    }
}

class DiaryEntry:Object {
    dynamic var startTime   =   0.0
    dynamic var endTime     =   0.0
    dynamic var date:NSDate = NSDate.init()
    dynamic var index:Int   =   0
}

class SleepDiary:Object {
    dynamic var startDate:NSDate = NSDate.init()
    dynamic var completed:Bool   = false
    let UID:String?              = "1234567890"
    var entries = List<DiaryEntry>()
}
