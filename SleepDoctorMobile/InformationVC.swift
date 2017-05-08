//
//  InformationVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/24/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class InformationVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var disorderArray = ["Sleep Apnea",
                         "Insomnia",
                         "Narcolepsy",
                         "RLS"]
    
    var descriptionArray = ["A condition where breathing stops for periods of time during the night.",
                            "A condition where you have trouble falling asleep at night",
                            "A condition where you suddenly fall asleep during waking hours.",
                            "A condition where you have trouble stopping movement of your body at night."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell", for: indexPath)
        
        let titleLabel = cell.viewWithTag(1) as! UILabel
        let descriptionLabel = cell.viewWithTag(2) as! UILabel
        
        titleLabel.text = disorderArray[indexPath.row]
        descriptionLabel.text = descriptionArray[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disorderArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Push a detail view
        let detailVC = DisorderDetailVC()
        detailVC.titleString = disorderArray[indexPath.row]
        detailVC.descriptionString = descriptionArray[indexPath.row]
        
        self.navigationController?.pushViewController(detailVC, animated: true)
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
