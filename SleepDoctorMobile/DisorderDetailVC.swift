//
//  DisorderDetailVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/24/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class DisorderDetailVC: UIViewController {
    
    var disorderCards:[FlashCard]?
    var flashCard1:FlashCardVC?
    var flashCard2:FlashCardVC?
    var flashCard3:FlashCardVC?
    var flashCard4:FlashCardVC?
    
    // Create some Card View Constants
    let cardPadding = Float(30.0)
    let cardSize    = CGSize(width: 295.0, height: 295.0)
    
    @IBOutlet weak var contentContainerView: UIView!
    
    init(withCards:[FlashCard]) {
        disorderCards = withCards
        
        // Define the Card VCs and give them thevartext content
        flashCard1 = FlashCardVC.init(withTitleString: (disorderCards?[0].title)!,
                                          descriptionString: (disorderCards?[0].description)!)
        flashCard2 = FlashCardVC.init(withTitleString: (disorderCards?[1].title)!,
                                          descriptionString: (disorderCards?[1].description)!)
        flashCard3 = FlashCardVC.init(withTitleString: (disorderCards?[2].title)!,
                                          descriptionString: (disorderCards?[2].description)!)
        flashCard4 = FlashCardVC.init(withTitleString: (disorderCards?[3].title)!,
                                          descriptionString: (disorderCards?[3].description)!)
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        disorderCards = FlashCardModel().insomniaCards
        // Define the Card VCs and give them their text content
        flashCard1 = FlashCardVC.init(withTitleString: (disorderCards?[0].title)!,
                                      descriptionString: (disorderCards?[0].description)!)
        flashCard2 = FlashCardVC.init(withTitleString: (disorderCards?[1].title)!,
                                      descriptionString: (disorderCards?[1].description)!)
        flashCard3 = FlashCardVC.init(withTitleString: (disorderCards?[2].title)!,
                                      descriptionString: (disorderCards?[2].description)!)
        flashCard4 = FlashCardVC.init(withTitleString: (disorderCards?[3].title)!,
                                      descriptionString: (disorderCards?[3].description)!)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //titleLabel.text = titleString
        //descriptionTextView.text = descriptionString
        // Do any additional setup after loading the view.
        print("Did load the disorder detail view")
        
        // TODO: Programmatically build the flashCard scrollview
        
        flashCard1?.titleString = disorderCards?[0].title
        flashCard1?.detailString  = disorderCards?[0].description
        
        flashCard2?.titleString = disorderCards?[1].title
        flashCard2?.detailString  = disorderCards?[1].description
        
        flashCard3?.titleString = disorderCards?[2].title
        flashCard3?.detailString  = disorderCards?[2].description
        
        flashCard4?.titleString = disorderCards?[3].title
        flashCard4?.detailString  = disorderCards?[3].description
        
        let cardArray  = [flashCard1!, flashCard2!, flashCard3!, flashCard4!]
        
        let cardX      = (self.view.frame.width / 2) - (cardSize.width / 2)
        
        //Make a little for loop that loops through, and places each flashCardVC in the scroll View's content container
        for (index, card) in cardArray.enumerated() {
            let paddingMultiplier = Float(index + 1)
            
            // Calculate the Card's Y Value
            let cardY = ((cardPadding * paddingMultiplier) + (Float(index) * Float(cardSize.height)))
            let cardOrigin = CGPoint(x: cardX, y: CGFloat(cardY))
            let cardFrame = CGRect(origin: cardOrigin, size: cardSize)
            
            // Set the card's position
            card.view.frame = cardFrame
            
            self.contentContainerView.addSubview(card.view)
            self.contentContainerView.bringSubview(toFront: card.view)
            print("Here's the card's new frame! ", card.view.frame)
            
            card.view.isUserInteractionEnabled = true
            
            // Add gesture recognizer to the card
            let singleTap = UITapGestureRecognizer(target: cardArray[index], action: #selector(cardArray[index].flip))
            singleTap.numberOfTapsRequired = 1
            cardArray[index].view.addGestureRecognizer(singleTap)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
