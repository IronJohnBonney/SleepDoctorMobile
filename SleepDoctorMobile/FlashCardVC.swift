//
//  FlashCardVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 5/16/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class FlashCardVC: UIViewController {
    
    private let backImageView: UIImageView! = UIImageView(image: UIImage(named: "Moonrise-BGImage"))
    private let frontImageView: UIImageView! = UIImageView(image: UIImage(named: "NightSky-BGImage"))
    
    private var frontTextLabel:UILabel? = UILabel()
    private var backTextLabel:UILabel? = UILabel()
    
    private var showingBack = false
    
    var titleString:String?
    var detailString:String?
    
    // MARK: Initializers
    init(withTitleString:String, descriptionString:String) {
        titleString  = withTitleString
        detailString = descriptionString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        titleString = "Title"
        detailString = "Here's a detail of this section."
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 8.0
        self.view.backgroundColor = themeColor
        
        //frontTextView = UITextView.init(frame: self.view.bounds)
        //frontTextView?.text = "Here's the front of the text view!"
        //frontTextView?.isEditable = false
        frontTextLabel = UILabel.init(frame: CGRect(x: 25.0, y: 77.0, width: 205.0, height: 100.0))
        // TODO: This text will be fed into the view by the disorder VC upon initialization
        frontTextLabel?.text = titleString!
        frontTextLabel?.textColor = UIColor.white
        frontTextLabel?.textAlignment = .center
        frontTextLabel?.backgroundColor = UIColor.clear
        frontTextLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 30.0)
        frontTextLabel?.numberOfLines = 0
        
        backTextLabel = UILabel.init(frame: CGRect(x: 25.0, y: 27.0, width: 205.0, height: 200.0))
        // TODO: This text will be fed into the view by the disorder VC upon initialization
        backTextLabel?.text = detailString!
        backTextLabel?.textAlignment = NSTextAlignment.center
        backTextLabel?.textColor = UIColor.white
        backTextLabel?.backgroundColor = UIColor.clear
        backTextLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20.0)
        
        backTextLabel?.numberOfLines = 0

        backTextLabel?.frame = CGRect(x: 25.0, y: 27.0, width: 205.0, height: 200.0)
        
        //self.view.addSubview(frontImageView)
        
        self.view.addSubview(frontTextLabel!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        frontTextLabel?.text = titleString!
        backTextLabel?.text = detailString!
    }
    
    override func viewDidLayoutSubviews() {
        print("Did layout subviews!")
        // Force text label to the frame so that it's not accidentally getting reset
        frontTextLabel?.frame = CGRect(x: 25.0, y: 77.0, width: 205.0, height: 100.0)
        backTextLabel?.frame = CGRect(x: 25.0, y: 27.0, width: 205.0, height: 200.0)
    }
    
    func flip() {
        //let toView = showingBack ? frontImageView : backImageView
        //let fromView = showingBack ? backImageView : frontImageView
        print("flipadelphia")
        
        let toView = showingBack ? frontTextLabel! : backTextLabel!
        let fromView = showingBack ? backTextLabel! : frontTextLabel!
        
        UIView.transition(from: fromView, to: toView, duration: 0.75, options: .transitionFlipFromRight, completion: nil)
        toView.translatesAutoresizingMaskIntoConstraints = false
        showingBack = !showingBack
    }
}
