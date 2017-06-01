//
//  InformationVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/24/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class InformationVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var disorderArray = FlashCardModel().disorders
    
    let allCards = FlashCardModel().allCards()
    
    @IBOutlet weak var sleepApneaButton: UIButton!
    @IBOutlet weak var narcolepsyButton: UIButton!
    @IBOutlet weak var rlsButton: UIButton!
    @IBOutlet weak var insomniaButton: UIButton!
    @IBOutlet weak var parasomniaButton: UIButton!
    @IBOutlet weak var sleepHygieneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonArray = [sleepApneaButton, narcolepsyButton, rlsButton, insomniaButton, parasomniaButton, sleepHygieneButton]
        
        for (index, button) in buttonArray.enumerated() {
            button?.layer.cornerRadius = 8.0
        }
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
        //descriptionLabel.text = descriptionArray[indexPath.row]
        
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
        //let detailVC = DisorderDetailVC()
        //detailVC.titleString = disorderArray[indexPath.row]
        //detailVC.descriptionString = descriptionArray[indexPath.row]
        
        //self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier! {
        case "pushSleepApnea":
            print("pushing sleepapnea")
            // Set the cards to the sleep apnea cards
            let dvc = segue.destination as! DisorderDetailVC
            dvc.disorderCards = allCards[0]
        case "pushInsomnia":
            print("pushing insomnia")
            let dvc = segue.destination as! DisorderDetailVC
            dvc.disorderCards = allCards[1]
        case "pushNarcolepsy":
            print("Pushing narcolepsy")
            let dvc = segue.destination as! DisorderDetailVC
            dvc.disorderCards = allCards[2]
        case "pushRestlessLeg":
            print("pushing Restless leg")
            let dvc = segue.destination as! DisorderDetailVC
            dvc.disorderCards = allCards[3]
        case "pushParasomnia":
            print("pushing parasomnia leg")
            let dvc = segue.destination as! DisorderDetailVC
            dvc.disorderCards = allCards[4]
        case "pushSleepHygiene":
            print("pushing sleepHygiene leg")
            let dvc = segue.destination as! DisorderDetailVC
            dvc.disorderCards = FlashCardModel().sleepHygieneCards
        default:
            print("None of the above ya goober")
        }        
    }
}
