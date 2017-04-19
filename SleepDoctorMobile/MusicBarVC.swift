//
//  MusicBarVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 3/22/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class MusicBarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedPlay(_ sender: Any) {
        print("Tapped Play")
    }
    
    @IBAction func tappedBar(_ sender: Any) {
        print("Tapped Music Bar")
        let musicController = MusicPlayerViewController()
        self.present(musicController, animated: true, completion: nil)
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
