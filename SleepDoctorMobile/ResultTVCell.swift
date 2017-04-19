//
//  ResultTVCell.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/19/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class ResultTVCell: UITableViewCell {

    @IBOutlet weak var resultSymbol: UILabel!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resultBGView: UIView!
    @IBOutlet weak var conditionName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
