//
//  DiaryEntryVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 5/22/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class DiaryEntryVC: UIViewController {
    
    var closure:(()->())? = nil
    
    let secondsInDay = 60*60*24
    
    let sleepDiaryRealm = SleepDiaryRealm()
    var diaryEntry:DiaryEntry?      // We pass in a diary entry, the VC sets the values,
                                    //   then we save with Realm
    var numberResponseRecorded:Int? // The int recording number of disturbances
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var gotInBedTimePicker: UIDatePicker!
    @IBOutlet weak var fellAsleepTimePicker: UIDatePicker!
    @IBOutlet weak var wokeUpTimePicker: UIDatePicker!
    @IBOutlet weak var gotOutOfBedTimePicker: UIDatePicker!
    @IBOutlet weak var sleepEfficiencyLabel: UILabel!
    @IBOutlet weak var timeAsleepLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 8.0
        zeroButton.layer.cornerRadius = 25.0
        oneButton.layer.cornerRadius = 25.0
        twoButton.layer.cornerRadius = 25.0
        
        // Set the view's date label
        dateLabel.text = (diaryEntry?.date as! Date).humanReadable() + " - " + ((diaryEntry?.date as! Date).addingTimeInterval(TimeInterval(secondsInDay))).humanReadable()
        
        // Initialize all of the date pickers. This will standardize them so that I can more accurately
        //   calculate the time that the user was asleep.
        
        gotInBedTimePicker.setDate(diaryEntry?.gotInBedTime as! Date, animated: true)
        fellAsleepTimePicker.setDate(diaryEntry?.fellAsleepTime as! Date, animated: true)
        wokeUpTimePicker.setDate(Date.init(timeInterval: Double(secondsInDay), since: diaryEntry?.wokeUpTime as! Date), animated: true)
        gotOutOfBedTimePicker.setDate(Date.init(timeInterval: Double(secondsInDay), since: diaryEntry?.gotOutOfBedTime as! Date), animated: true)
        
        
        let sleepEfficiency = Float(wokeUpTimePicker.date.minutes(from: fellAsleepTimePicker.date)) / Float(gotOutOfBedTimePicker.date.minutes(from: gotInBedTimePicker.date)) * 100.0
        
        sleepEfficiencyLabel.text = "\(Int(sleepEfficiency))%"
        let hoursSlept = (diaryEntry?.minutesAsleep)!/60
        let minutesSlept = (diaryEntry?.minutesAsleep)! - (hoursSlept * 60)
        timeAsleepLabel.text = "\(hoursSlept)hr \(minutesSlept)min"
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let closure = closure {
            closure()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedZeroButton(_ sender: Any) {
        // Highlight Zero
        zeroButton.backgroundColor = themeColor
        zeroButton.setTitleColor(UIColor.white, for: .normal)
        
        // De-Highlight the other buttons
        oneButton.backgroundColor = UIColor.white
        oneButton.setTitleColor(themeColor, for: .normal)
        twoButton.backgroundColor = UIColor.white
        twoButton.setTitleColor(themeColor, for: .normal)
        
        numberResponseRecorded = 0
    }
    
    @IBAction func tappedOneButton(_ sender: Any) {
        // Highlight One
        oneButton.backgroundColor = themeColor
        oneButton.setTitleColor(UIColor.white, for: .normal)
        
        // De-Highlight the other buttons
        zeroButton.backgroundColor = UIColor.white
        zeroButton.setTitleColor(themeColor, for: .normal)
        twoButton.backgroundColor = UIColor.white
        twoButton.setTitleColor(themeColor, for: .normal)
        
        numberResponseRecorded = 1
    }
    
    @IBAction func tappedTwoButton(_ sender: Any) {
        print("Tapped two")
        
        // Highlight two, dehighlight the other buttons.
        twoButton.backgroundColor = themeColor
        twoButton.setTitleColor(UIColor.white, for: .normal)
        
        // De-Highlight the other buttons
        zeroButton.backgroundColor = UIColor.white
        zeroButton.setTitleColor(themeColor, for: .normal)
        oneButton.backgroundColor = UIColor.white
        oneButton.setTitleColor(themeColor, for: .normal)
        
        numberResponseRecorded = 2
    }
    
    @IBAction func tappedSave(_ sender: Any) {
        // TODO: This will save the date entry object with realm
        // Also: Consider checking if the date entries were modified at all, or if the date pickers were ever initialized. We don't want a user setting meaningless dates? Or we could just init reasonable times for them and let them adjust them.
        guard (numberResponseRecorded != nil) else {
            print("Haven't recorded a response of disturbances yet!")
            
            let a = UIAlertController.init(title: "Missing Information"  , message: "Make sure you set the sleep times and select the number of times you woke up in the night before continuing.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                print("Got it")
            }
            
            a.addAction(okAction)
            
            self.present(a, animated: true, completion: nil)
            
            return
        }
        
        print("Tapped Save")
        
        print("----- Here are the dates: -----")
        print(gotInBedTimePicker.date)
        print(fellAsleepTimePicker.date)
        print(wokeUpTimePicker.date)
        print(gotOutOfBedTimePicker.date)
        print("-------------------------------")
        
        print("--- Here are the dates calculations: ---")
        print("Hours from fell asleep to woke up: ", wokeUpTimePicker.date.hours(from: fellAsleepTimePicker.date))
        print("Minutes from fell asleep to woke up: ", wokeUpTimePicker.date.minutes(from: fellAsleepTimePicker.date))
        print("Minutes from got in bed to fell asleep: ", fellAsleepTimePicker.date.minutes(from: gotInBedTimePicker.date))
        print("----------------------------------------")
        
        // Make Adjustments to the sleep dates if they are greater than 24 hours away from the wake up times. This takes care of the case where the fall asleep times are in the AM (Midnight or greater).
        if (wokeUpTimePicker.date.hours(from: fellAsleepTimePicker.date) > 24) {
            fellAsleepTimePicker.date.addTimeInterval(TimeInterval(secondsInDay))
            
            if (fellAsleepTimePicker.date.hours(from: gotInBedTimePicker.date) > 24) {
                gotInBedTimePicker.date.addTimeInterval(TimeInterval(secondsInDay))
            }
        }
        
        print("--- Here are the dates calculations post adjustment: ---")
        print("Hours from fell asleep to woke up: ", wokeUpTimePicker.date.hours(from: fellAsleepTimePicker.date))
        print("Minutes from fell asleep to woke up: ", wokeUpTimePicker.date.minutes(from: fellAsleepTimePicker.date))
        print("Minutes from got in bed to fell asleep: ", fellAsleepTimePicker.date.minutes(from: gotInBedTimePicker.date))
        print("----------------------------------------")
        
        print("-----Sleep Efficiency Calculation-----")
        let sleepEfficiency = Float(wokeUpTimePicker.date.minutes(from: fellAsleepTimePicker.date)) / Float(gotOutOfBedTimePicker.date.minutes(from: gotInBedTimePicker.date))        
        print ("Sleep Effeciency = ", sleepEfficiency)
        print("--------------------------------------")
        

        // Set the dates
        // TODO: This might need some finaggling to get the days correct, otherwise since they're just time pickers, they might just all init to the same day then calculations for time slept will be off. Will need to test it out.
        
        var updatedEntry = DiaryEntry()
        
        updatedEntry.gotInBedTime    = gotInBedTimePicker.date as NSDate
        updatedEntry.fellAsleepTime  = fellAsleepTimePicker.date as NSDate
        updatedEntry.wokeUpTime      = wokeUpTimePicker.date as NSDate
        updatedEntry.gotOutOfBedTime = gotOutOfBedTimePicker.date as NSDate
        updatedEntry.sleepEfficiency = sleepEfficiency
        updatedEntry.minutesAsleep   = wokeUpTimePicker.date.minutes(from: fellAsleepTimePicker.date)
        updatedEntry.numberOfDisturbances = numberResponseRecorded!
        updatedEntry.id              = (diaryEntry?.id)!
        updatedEntry.index           = (diaryEntry?.index)!
        updatedEntry.date            = (diaryEntry?.date)!
        // Save the changes to the sleep diary realm
        sleepDiaryRealm.updateEntry(withEntry: updatedEntry)
        
        sleepEfficiencyLabel.text = String.init(format: "%.2f%", sleepEfficiency)
        let hoursSlept = (updatedEntry.minutesAsleep)/60
        let minutesSlept = updatedEntry.minutesAsleep - (hoursSlept * 60)
        timeAsleepLabel.text = "\(hoursSlept)hr \(minutesSlept)min"
        
        let a = UIAlertController.init(title: "Success"  , message: "You've updated this entry in your sleep diary", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            print("Aww yiss")
        }
        
        a.addAction(okAction)
        
        self.present(a, animated: true, completion: nil)
        //self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
