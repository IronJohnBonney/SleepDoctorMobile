//
//  DiaryEntryVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 5/22/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class DiaryEntryVC: UIViewController {

    var diaryEntry:DiaryEntry?      // We pass in a diary entry, the VC sets the values, then we save with Realm
    var numberResponseRecorded:Int? // The int recording number of disturbances
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var gotInBedTimePicker: UIDatePicker!
    @IBOutlet weak var fellAsleepTimePicker: UIDatePicker!
    @IBOutlet weak var wokeUpTimePicker: UIDatePicker!
    @IBOutlet weak var gotOutOfBedTimePicker: UIDatePicker!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 8.0
        
        // TODO: We will need to set all of the label values if there is an entry already.
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
    }
    
    
    @IBAction func tappedSave(_ sender: Any) {
        // TODO: This will save the date entry object with realm
        // Also: Consider checking if the date entries were modified at all, or if the date pickers were ever initialized. We don't want a user setting meaningless dates? Or we could just init reasonable times for them and let them adjust them.
        print("Tapped Save")
        
        print("----- Here are the dates: -----")
        print(gotInBedTimePicker.date)
        print(fellAsleepTimePicker.date)
        print(wokeUpTimePicker.date)
        print(gotOutOfBedTimePicker.date)
        print("-------------------------------")
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
