//
//  SleepDiaryVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/21/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class SleepDiaryVC: UIViewController {
    
    var activeSleepDiary:SleepDiary?
    var selectedEntryIndex = 0
    
    /* 
     *** MARK: Sleep Bar Graph Outlets
     */
    @IBOutlet weak var graphBackgroundView: UIView!
    
    // Sleep Graph Bars: Tags = NightButtonTag + 100
    @IBOutlet weak var bar1: UIView!  // Tag = 101
    @IBOutlet weak var bar2: UIView!
    @IBOutlet weak var bar3: UIView!
    @IBOutlet weak var bar4: UIView!
    @IBOutlet weak var bar5: UIView!
    @IBOutlet weak var bar6: UIView!
    @IBOutlet weak var bar7: UIView!
    @IBOutlet weak var bar8: UIView!
    @IBOutlet weak var bar9: UIView!
    @IBOutlet weak var bar10: UIView!
    @IBOutlet weak var bar11: UIView!
    @IBOutlet weak var bar12: UIView!
    @IBOutlet weak var bar13: UIView!
    @IBOutlet weak var bar14: UIView! // Tag = 114
    
    // Night Buttons
    @IBOutlet weak var night1Button: UIButton!  // Tag = 1
    @IBOutlet weak var night2Button: UIButton!
    @IBOutlet weak var night3Button: UIButton!
    @IBOutlet weak var night4Button: UIButton!
    @IBOutlet weak var night5Button: UIButton!
    @IBOutlet weak var night6Button: UIButton!
    @IBOutlet weak var night7Button: UIButton!
    @IBOutlet weak var night8Button: UIButton!
    @IBOutlet weak var night9Button: UIButton!
    @IBOutlet weak var night10Button: UIButton!
    @IBOutlet weak var night11Button: UIButton!
    @IBOutlet weak var night12Button: UIButton!
    @IBOutlet weak var night13Button: UIButton!
    @IBOutlet weak var night14Button: UIButton! // Tag = 14
    
    /*
     *** MARK: Entry Controls Outlets
     */
    
        // General
    @IBOutlet weak var updateEntryButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
        // Time Pickers
    @IBOutlet weak var sleepTimePicker: UIDatePicker!
    @IBOutlet weak var wakeTimePicker: UIDatePicker!
    
        // Woke up buttons
    @IBOutlet weak var woke0Button: UIButton!
    @IBOutlet weak var woke1Button: UIButton!
    @IBOutlet weak var woke2Button: UIButton!
    
    /*
     *** MARK: Overall Control Outlets
     */
    @IBOutlet weak var beginDiaryButton: UIButton!
    
    init() {
        print("init")
        var sleepDiary = SleepDiaryRealm().getCurrentDiary()
        
        if let diaryObject = sleepDiary {
            print("We've got an active sleep diary!")
            // Init the view with the diary's data
            activeSleepDiary = sleepDiary
        } else {
            print("There is no active sleep diary!")
            // Set up view for user to activate the sleep diary
            activeSleepDiary = nil
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        var sleepDiary = SleepDiaryRealm().getCurrentDiary()
        
        if let diaryObject = sleepDiary {
            print("We've got an active sleep diary!")
            // Init the view with the diary's data
            activeSleepDiary = sleepDiary
        } else {
            print("There is no active sleep diary!")
            // Set up view for user to activate the sleep diary
            activeSleepDiary = nil
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphBackgroundView.layer.cornerRadius = 12.0
        
        //updateEntryButton.layer.cornerRadius = 12.0
        beginDiaryButton.layer.cornerRadius  = 12.0
        
        // Format Night Buttons
        let nightButtonArray = [night1Button,  night2Button,  night3Button,
                                night4Button,  night5Button,  night6Button,
                                night7Button,  night8Button,  night9Button,
                                night10Button, night11Button, night12Button,
                                night13Button, night14Button]
        
        for (index, button) in nightButtonArray.enumerated() {
            let nightButton = button as! UIButton
            nightButton.layer.cornerRadius  = 8.0
            nightButton.layer.masksToBounds = true
        }
        
        // Format Bar Graph Bars
        let barGraphArray = [bar1,  bar2,  bar3,
                             bar4,  bar5,  bar6,
                             bar7,  bar8,  bar9,
                             bar10, bar11, bar12,
                             bar13, bar14]
        
        for (index, graphBar) in barGraphArray.enumerated() {
            let bar = graphBar as! UIView
            bar.layer.cornerRadius  = 8.0
            bar.layer.masksToBounds = true
        }
        
        // TODO: Check with SleepDiaryRealm if there is already an active diary (will need to do a query of all diary objects that are active)
        let activeSleepDiary = getActiveSleepDiary()
        
        if let sleepDiary = activeSleepDiary {
            // The diary exists, set up the view accordingly
        } else {
            // The diary doesn't exist yet. Disable the night buttons and show the begin diary button
            disableAllNightButtons()
            beginDiaryButton.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
        // TODO: Everytime the view will appear, we should run through all of the bars and make sure
        //          their widths are correct, and make sure the view is updated.
        /*
        if let sleepDiary = activeSleepDiary {
            // Only update the bars if there is an active sleep diary.
            print("Gonna format some bars")
            formatSleepBars()
        }
 */
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        if let sleepDiary = activeSleepDiary {
            // Only update the bars if there is an active sleep diary.
            print("Gonna format some bars")
            formatSleepBars()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getActiveSleepDiary() -> SleepDiary? {
        var sleepDiary = SleepDiaryRealm().getCurrentDiary()
        
        if let diaryObject = sleepDiary {
            print("We've got an active sleep diary!")
            // Init the view with the diary's data
            return sleepDiary
        } else {
            print("There is no active sleep diary!")
            // Set up view for user to activate the sleep diary
            return nil
        }
    }
    
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func enableAllNightButtons() {
        let nightButtonArray = [night1Button,  night2Button,  night3Button,
                                night4Button,  night5Button,  night6Button,
                                night7Button,  night8Button,  night9Button,
                                night10Button, night11Button, night12Button,
                                night13Button, night14Button]
        
        for (index, button) in nightButtonArray.enumerated() {
            // Disable all night buttons
            button?.isEnabled = true
        }
    }
    
    func disableAllNightButtons() {
        let nightButtonArray = [night1Button,  night2Button,  night3Button,
                                night4Button,  night5Button,  night6Button,
                                night7Button,  night8Button,  night9Button,
                                night10Button, night11Button, night12Button,
                                night13Button, night14Button]
        
        for (index, button) in nightButtonArray.enumerated() {
            // Disable all night buttons
            button?.isEnabled = false
        }
    }
    
    @IBAction func tappedBeginSleepDiary(_ sender: Any) {
        // Ask the sleep diary realm to create and return a new sleep diary object
        self.activeSleepDiary = SleepDiaryRealm().createNewDiary()
        
        enableAllNightButtons()
    }
    
    @IBAction func tappedNightButton(_ sender: Any) {
        let button = sender as! UIButton
        let tag = button.tag
        tappedButton(withTag: tag)
    }
    
    func formatSleepBars() {
        var i = 101 // This is the sleep bar entry
        for entry in (activeSleepDiary?.entries)! {
            let fellAsleepTime = entry.fellAsleepTime as Date
            
            let minutesAsleep = entry.minutesAsleep
            let hoursAsleep = minutesAsleep / 60 // determines the width of the bar
            
            let graphWidth = graphBackgroundView.frame.width
            let widthInHours = 24
            let scaledWidth = (CGFloat(hoursAsleep) / CGFloat(widthInHours)) * graphWidth
            
            var sleepHour = Calendar.current.component(.hour, from: fellAsleepTime)
            print("SleepHour: ", sleepHour)
            var sleepSpace = sleepHour - 15 // difference in hours from beginning to bar
            print("SleepSpace: ", sleepSpace)
            
            // Correction for when the sleep time was set to an AM time
            if (sleepSpace < 0) {
                sleepSpace += 24
            }
            
            let scaledX = (CGFloat(sleepSpace) / CGFloat(widthInHours)) * graphWidth
            

            // Pass the newly calculated values to the bar
            let sleepBar = self.view.viewWithTag(i) as! UIView
            print("scaledX: ", scaledX, "scaledWidth: ", scaledWidth, "BarOrigin: ", sleepBar.frame.origin, "BarWidth: ", sleepBar.frame.width)
            
            let newFrame = CGRect(x: scaledX, y: sleepBar.frame.origin.y, width: scaledWidth, height: sleepBar.frame.size.height)
            sleepBar.frame = newFrame
            //Increment i and format the next bar
            i+=1
        }
        
        // TODO: After alls said and done, update autolayout if needed?
        self.view.layoutIfNeeded()
    }
    
    func tappedButton(withTag:Int) {
        // Highlight that specific button, dehighlight all other buttons
        highlightNightButton(withTag: withTag)
        //  Show the diary entry for that dates sleep/wake up times.
        sleepTimePicker.date = activeSleepDiary?.entries[withTag - 1].fellAsleepTime as! Date
        wakeTimePicker.date = activeSleepDiary?.entries[withTag - 1].wokeUpTime as! Date
        // Set the selected Entry index
        selectedEntryIndex = (withTag - 1)
    }
    
    func highlightNightButton(withTag: Int) {
        
        let nightButtonArray = [night1Button,  night2Button,  night3Button,
                                night4Button,  night5Button,  night6Button,
                                night7Button,  night8Button,  night9Button,
                                night10Button, night11Button, night12Button,
                                night13Button, night14Button]
        
        for (index, button) in nightButtonArray.enumerated() {
            if (button?.tag == withTag) {
                //Highlight the button
                button?.backgroundColor = themeColor
                button?.setTitleColor(UIColor.white, for: .normal)
            } else {
                button?.backgroundColor = UIColor.white
                button?.setTitleColor(themeColor, for: .normal)
            }
        }

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "pushDiaryEntry") {
            var dvc = segue.destination as! DiaryEntryVC
            print("pushing the diary entry view controller")
            // TODO: Grab the diary entry object from SleepDiaryRealm and pass it to the dvc
            dvc.diaryEntry = activeSleepDiary?.entries[selectedEntryIndex]
        }
    }
}
