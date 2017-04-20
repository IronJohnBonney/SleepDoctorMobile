//
//  HomeViewController.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 3/29/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var surveyButton: UIButton!
    @IBOutlet weak var meditateButton: UIButton!
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var jetlagButton: UIButton!
    @IBOutlet weak var informationButton: UIButton!    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let buttonArray = [surveyButton, meditateButton, calendarButton, jetlagButton, informationButton]
        
        for button in buttonArray {
            button?.layer.cornerRadius = 50.0
            button?.layer.borderColor = UIColor.white.cgColor
            button?.layer.borderWidth = 3.0
            button?.layer.masksToBounds = true
        }
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
