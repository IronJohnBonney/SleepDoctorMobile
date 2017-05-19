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
    @IBOutlet weak var aboutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonArray = [surveyButton, meditateButton, calendarButton, jetlagButton, informationButton, aboutButton]
        
        for button in buttonArray {
            button?.layer.cornerRadius = 50.0
            button?.layer.borderColor = UIColor.white.cgColor
            button?.layer.borderWidth = 3.0
            button?.layer.masksToBounds = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
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

class JetlagCalculatorVC: UIViewController {
    
    @IBOutlet weak var jetlagRoosterButton: UIButton!
    @IBOutlet weak var baCalculatorButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Format the buttons
        jetlagRoosterButton.layer.cornerRadius = 60.0
        baCalculatorButton.layer.cornerRadius = 60.0
    }
}

class JetlagWebView: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        print("jetlag webview did load")
        super.viewDidLoad()
        let url = URL(string: "http://jetlagrooster.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}

class BritishAirwaysWebView: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        print("BA webview did load")
        super.viewDidLoad()
        let url = URL(string: "https://www.britishairways.com/travel/drsleep/public/en_au")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
}

class AboutUsWebview: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        print("jetlag webview did load")
        super.viewDidLoad()
        let url = URL(string: "http://ansaustin.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
}
