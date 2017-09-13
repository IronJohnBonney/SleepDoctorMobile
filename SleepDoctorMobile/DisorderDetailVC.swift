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
    
    // These are essentially placeholders for flashcards. The reason we have to add them here
    //   is so that they have strong references to receive the tap gesture messages, otherwise
    //   they don't flip when you tap them. The number of flashcards still gets set automatically
    //   based on the count of the flashcard objects in the FlashCardModel, but 10 is the current
    //   limit. To increase the max number of cards, new FlashCardVC objects need to be added.
    var flashCard1:FlashCardVC?
    var flashCard2:FlashCardVC?
    var flashCard3:FlashCardVC?
    var flashCard4:FlashCardVC?
    var flashCard5:FlashCardVC?
    var flashCard6:FlashCardVC?
    var flashCard7:FlashCardVC?
    var flashCard8:FlashCardVC?
    var flashCard9:FlashCardVC?
    var flashCard10:FlashCardVC?
    var flashCard11:FlashCardVC?
    var flashCard12:FlashCardVC?
    var flashCard13:FlashCardVC?
    var flashCard14:FlashCardVC?
    var flashCard15:FlashCardVC?
    var flashCard16:FlashCardVC?
    var flashCard17:FlashCardVC?
    var flashCard18:FlashCardVC?
    var flashCard19:FlashCardVC?
    var flashCard20:FlashCardVC?
    
    // Create some Card View Constants
    let cardPadding = Float(30.0)
    let cardSize    = CGSize(width: 300.0, height: 300.0)
    
    @IBOutlet weak var flashcardScrollView: UIScrollView!
    @IBOutlet weak var contentContainerView: UIView!
    
    @IBOutlet weak var contentContainerHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var scrollViewHeightConstraint: NSLayoutConstraint!
    
    init(withCards:[FlashCard]) {
        disorderCards = withCards
        
        // Define the Card VCs and give them thevartext content
        flashCard1 = FlashCardVC.init(withTitleString: "Filler",
                                          descriptionString: "Filler")
        flashCard2 = FlashCardVC.init(withTitleString: "Filler",
                                          descriptionString: "Filler")
        flashCard3 = FlashCardVC.init(withTitleString: "Filler",
                                          descriptionString: "Filler")
        flashCard4 = FlashCardVC.init(withTitleString: "Filler",
                                          descriptionString: "Filler")
        flashCard5 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard6 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard7 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard8 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard9 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard10 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard11 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard12 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard13 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard14 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard15 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard16 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard17 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard18 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard19 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard20 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        disorderCards = FlashCardModel().insomniaCards
        // Define the Card VCs and give them their text content
        flashCard1 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard2 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard3 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard4 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard5 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard6 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard7 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard8 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard9 = FlashCardVC.init(withTitleString: "Filler",
                                      descriptionString: "Filler")
        flashCard10 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard11 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard12 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard13 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard14 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard15 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard16 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard17 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard18 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard19 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        flashCard20 = FlashCardVC.init(withTitleString: "Filler",
                                       descriptionString: "Filler")
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //titleLabel.text = titleString
        //descriptionTextView.text = descriptionString
        // Do any additional setup after loading the view.
        print("Did load the disorder detail view")
        
        // TODO: Programmatically build the flashCard scrollview
        // Start by setting the scroll view height.
        
        let cardCount = disorderCards?.count
        let scrollHeight = (CGFloat(cardCount!) * cardSize.height) + (CGFloat(cardPadding) * CGFloat(cardCount! + 1))
        
        //flashcardScrollView.contentSize = CGSize(width: flashcardScrollView.frame.size.width, height: 5000.0)
        contentContainerHeightContraint.constant = scrollHeight
        //contentContainerView.frame.size = CGSize(width: flashcardScrollView.frame.size.width, height: 900.0)
        self.view.layoutIfNeeded()
        /*
        flashCard1?.titleString = disorderCards?[0].title
        flashCard1?.detailString  = disorderCards?[0].description
        
        flashCard2?.titleString = disorderCards?[1].title
        flashCard2?.detailString  = disorderCards?[1].description
        
        flashCard3?.titleString = disorderCards?[2].title
        flashCard3?.detailString  = disorderCards?[2].description
        
        flashCard4?.titleString = disorderCards?[3].title
        flashCard4?.detailString  = disorderCards?[3].description
 */
        
        
        var cardArray:[FlashCardVC]  = []  //[flashCard1!, flashCard2!, flashCard3!, flashCard4!]
        
        // Flash Card Array Builder
        for i in 0..<cardCount! {
            // Init another flash Card and add it to the card array
            let newFlashCardVC = FlashCardVC.init(withTitleString: (disorderCards?[i].title)!, descriptionString: (disorderCards?[i].description)!)

            // Try running a switch statement inside the for loop that gives the flashCardVC's strong references.
            switch i {
            case 0:
                flashCard1 = newFlashCardVC
                cardArray.append(flashCard1!)
            case 1:
                flashCard2 = newFlashCardVC
                cardArray.append(flashCard2!)
            case 2:
                flashCard3 = newFlashCardVC
                cardArray.append(flashCard3!)
            case 3:
                flashCard4 = newFlashCardVC
                cardArray.append(flashCard4!)
            case 4:
                flashCard5 = newFlashCardVC
                cardArray.append(flashCard5!)
            case 5:
                flashCard6 = newFlashCardVC
                cardArray.append(flashCard6!)
            case 6:
                flashCard7 = newFlashCardVC
                cardArray.append(flashCard7!)
            case 7:
                flashCard8 = newFlashCardVC
                cardArray.append(flashCard8!)
            case 8:
                flashCard9 = newFlashCardVC
                cardArray.append(flashCard9!)
            case 9:
                flashCard10 = newFlashCardVC
                cardArray.append(flashCard10!)
            case 10:
                flashCard11 = newFlashCardVC
                cardArray.append(flashCard11!)
            case 11:
                flashCard12 = newFlashCardVC
                cardArray.append(flashCard12!)
            case 12:
                flashCard13 = newFlashCardVC
                cardArray.append(flashCard13!)
            case 13:
                flashCard14 = newFlashCardVC
                cardArray.append(flashCard14!)
            case 14:
                flashCard15 = newFlashCardVC
                cardArray.append(flashCard15!)
            case 15:
                flashCard16 = newFlashCardVC
                cardArray.append(flashCard16!)
            case 16:
                flashCard17 = newFlashCardVC
                cardArray.append(flashCard17!)
            case 17:
                flashCard18 = newFlashCardVC
                cardArray.append(flashCard18!)
            case 18:
                flashCard19 = newFlashCardVC
                cardArray.append(flashCard19!)
            case 19:
                flashCard20 = newFlashCardVC
                cardArray.append(flashCard20!)                
            default:
                print("Default case inside the flash card array builder!")
            }
        }
        
        let cardX = (self.view.frame.width / 2) - (cardSize.width / 2)
        
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
        print("VIEW WILL APPEAR")
        self.navigationController?.navigationBar.isHidden = false
        //contentContainerView.frame.size.height = flashcardScrollView.contentSize.height
    }
    
    override func viewDidLayoutSubviews() {
        //Finally, set ScrollViewHeight and Content Frame height based on all of the flash cards we just added.
        print("VIEW DID LAYOUT SUBVIEWS")
        let lLast = flashcardScrollView.subviews.last
        let wd    = lLast?.frame.origin.y
        let ht    = lLast?.frame.size.height
        
        let sizeOfContent = wd!+ht!+CGFloat(cardPadding)

        //flashcardScrollView.contentSize = CGSize(width: flashcardScrollView.frame.size.width, height: 1500.0)
        //contentContainerView.frame.size = flashcardScrollView.contentSize
        //self.view.frame.size.height = 5000.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tappedBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
