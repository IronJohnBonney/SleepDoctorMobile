//
//  SleepDiaryVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/21/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class SleepDiaryVC: UIViewController {

    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEntryButton.layer.cornerRadius = 12.0
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
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
