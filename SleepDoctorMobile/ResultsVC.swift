//
//  ResultsVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/19/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /* For results table cell:
        * Tag 1 = Result Symbol
        * Tag 2 = Result Text
        * Tag 3 = Condition Name
        * Tag 4 = Condition Description
        * Tag 5 = Result Color View
    */
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var sleepHygieneButton: UIButton!
    
    // Used to pass to the results VC
    var disorderCards = FlashCardModel().allCards()
    
    var resultsArray:[Bool]?
    
    var disorderArray = ["Sleep Apnea",
                         "Insomnia",
                         "Narcolepsy",
                         "RLS"]
    
    var descriptionArray = ["A condition where breathing stops for periods of time during the night.",
                            "A condition where you have trouble falling asleep at night",
                            "A condition where you suddenly fall asleep during waking hours.",
                            "A condition where you have trouble stopping movement of your body at night."]
    
    init(results: [Bool]) {
        self.resultsArray = results
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register the identifier with the cell.
        //self.resultsTableView.register(ResultTVCell.self, forCellReuseIdentifier: "QResultCell")
        self.resultsTableView.register(UINib(nibName: "ResultTVCell", bundle: Bundle.main), forCellReuseIdentifier: "ResultCell")
        
        // Format tableView
        resultsTableView.layer.cornerRadius = 12.0
        
        //
        resultsTableView.contentInset = UIEdgeInsetsMake(-20.0, 0.0, 0.0, 0.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tappedSleepHygieneButton(_ sender: Any) {
        print("Push the sleep hygiene flash Card View")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultTVCell
        
        
        // Configure result symbol area
        //let resultSymbol = cell.contentView.viewWithTag(1) as! UILabel
        //let resultText   = cell.contentView.viewWithTag(2) as! UILabel
        //let resultBGView = cell.contentView.viewWithTag(5)
        
        
        
        if (resultsArray?[indexPath.row] == true) {
            // High Risk
            cell.resultSymbol.text = "!"
            cell.resultText.text   = "At Risk"
            cell.resultBGView?.backgroundColor = UIColor.red
        } else {
            // Low Risk
            cell.resultSymbol.text = "OK"
            cell.resultText.text   = "Low Risk"
            cell.resultBGView?.backgroundColor = UIColor.green
        }
        
        // Config the rest of the cell
        //let conditionName = cell.contentView.viewWithTag(3) as! UILabel
        //let conditionDescription = cell.contentView.viewWithTag(4) as! UILabel
        
        cell.conditionName.text        = disorderArray[indexPath.row]
        cell.descriptionLabel.text = descriptionArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return disorderArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped row \(indexPath.row)")
        
        print("Condition: \(disorderArray[indexPath.row])")
        print("Description: \(descriptionArray[indexPath.row])")
        
        
        // TODO: Push the disorder detail view
        print("Will push a disorder detail view so that the user can learn more about the condition, such as symptoms, risk factors, and treatment")
        
        
        // Pass the detailVC the flash cards to display
        //let detailVC = DisorderDetailVC.init(withCards: disorderCards[indexPath.row])
        let detailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DisorderDetailVC
        detailVC.disorderCards = disorderCards[indexPath.row]
        
        print("Here's the detail VC: ", detailVC)
        print("And the nav controller: ", self.navigationController)
        
        // Push the detail view
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
