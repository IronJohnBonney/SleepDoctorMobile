//
//  QuestionnaireVC.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/18/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class QuestionnaireIntroVC: UIViewController {
    
    @IBOutlet weak var startQuestionnaireButton: UIButton!
    @IBOutlet weak var circularProgressView: KDCircularProgress!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startQuestionnaireButton.layer.cornerRadius = 8.0
        
        /*
        let progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .forward
        progress.glowAmount = 0.9
        progress.set(colors: UIColor.cyan ,UIColor.white, UIColor.magenta, UIColor.white, UIColor.orange)
        progress.center = CGPoint(x: circularProgressView.center.x, y: circularProgressView.center.y + 25)
        circularProgressView.addSubview(progress)
 */
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setProgress()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        /*
        let progress = KDCircularProgress(frame: circularProgressView.frame)
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .forward
        progress.glowAmount = 0.9
        progress.set(colors: UIColor.cyan ,UIColor.white, UIColor.magenta, UIColor.white, UIColor.orange)
        */
        //progress.center = CGPoint(x: circularProgressView.center.x, y: circularProgressView.center.y + 25)
        //circularProgressView = progress
    }
    
    @IBAction func tappedResetAllAnswers(_ sender: Any) {
        
        let a = UIAlertController.init(title: "Reset all answers?", message: "Would you like to reset all of your questionnaire answers? You will be required to take the questionnaire from the beginning.", preferredStyle: .alert)
        
        //a.view.backgroundColor = UIColor.blackColor()
        //a.view.tintColor = UIColor.blueColor()
        
        let okAction = UIAlertAction(title: "Reset", style: UIAlertActionStyle.destructive) {
            UIAlertAction in
            print("Reset all of the answers")
            QuestionnaireAnalyzer().resetAllResponses()
            print("All responses have been reset.")
            // Update view to accomodate for the changes. This actually means just resetting
            //      the circular progress view to 0%
            self.setProgress()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
            print("User tapped cancel, don't do anything")
        }
        
        a.addAction(okAction)
        a.addAction(cancelAction)
        
        self.present(a, animated: true, completion: nil)
    }
    
    
    func setProgress() {
        // TODO: Check the current progress then
        let questionIndex:Int? = UserDefaults.standard.integer(forKey: questionIndexKey)
        if let index = questionIndex {
            //Float(index)/41.0
            //circularProgressView.progres
            let progress = Int((Float(index) / 55.0) * 100)
            print("Progress in value", progress)
            
            // Set progress label percentage. If progress >= 100, just set it to be full.
            if (progress >= 100) {
                percentLabel.text = "100%"
                let progressAngle = 360.0
                circularProgressView.animate(fromAngle: 0.0, toAngle: progressAngle, duration: 0.5, completion: nil)
            } else {
                percentLabel.text = String(progress) + "%"
                let progressAngle = (Double(index) / 55.0) * 360.0
                circularProgressView.animate(fromAngle: 0.0, toAngle: progressAngle, duration: 0.5, completion: nil)
            }
            
        } else {
            print("No current progress derpaderp")
        }
    }
}

class QuestionnaireVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var previousQuestionButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Group 1 - UI Elements for the intro view
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var selectGenderLabel: UILabel!
    @IBOutlet weak var maleGenderButton: UIButton!
    @IBOutlet weak var femaleGenderButton: UIButton!
    
    // Group 2 - UI Elements for Yes/No Questions
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    // Group 3 - UI Elements for 1-5 Questions
    @IBOutlet weak var epworthPrompt: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton! // Removed, only need 1-4
    
    // Intro Value Trackers
    var gender:Gender?
    
    // Progress Trackers
    var questionIndex:Int?
    var responseRecorded:Bool?
    var numberResponseRecorded:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nextQuestionButton.layer.cornerRadius = 12.0
        
        // Config Gender Buttons
        maleGenderButton.layer.cornerRadius = 40.0
        maleGenderButton.layer.borderColor = themeColor.cgColor
        maleGenderButton.layer.borderWidth = 2.0
        maleGenderButton.layer.masksToBounds = true
        
        femaleGenderButton.layer.cornerRadius = 40.0
        femaleGenderButton.layer.borderColor = themeColor.cgColor
        femaleGenderButton.layer.borderWidth = 2.0
        femaleGenderButton.layer.masksToBounds = true
        
        
        // Format Yes/No Buttons
        yesButton.layer.cornerRadius = 12.0
        yesButton.layer.borderColor = themeColor.cgColor
        yesButton.layer.borderWidth = 2.0
        yesButton.layer.masksToBounds = true
        
        noButton.layer.cornerRadius = 12.0
        noButton.layer.borderColor = themeColor.cgColor
        noButton.layer.borderWidth = 2.0
        noButton.layer.masksToBounds = true
        
        
        // Format number buttons
        let numberButtonArray = [oneButton, twoButton, threeButton, fourButton, fiveButton]
        
        for (index, object) in numberButtonArray.enumerated() {
            
            object?.layer.borderColor  = themeColor.cgColor
            object?.layer.borderWidth = 2.0
            object?.layer.cornerRadius = 25.0
            object?.layer.masksToBounds = true
        }
        
        
        questionIndex = UserDefaults.standard.integer(forKey: questionIndexKey)
        
        
        if let qIndex = questionIndex {
            // There's a question index
            
            // TODO: Insert check for which type of question (determines which UI Group to show)
            setupView(forIndex: qIndex)
            checkProgress()
            
        } else {
            // No existing question index. Start from scratch.
            // Show correct UI Elements
            setupView(forIndex: 0)
        }
    }
    
    @IBAction func presentResults(_ sender: Any) {
        
        let analyzer = QuestionnaireAnalyzer()
        let results = analyzer.analyzeQuestionnaireResults()
        
        let resultsVC = ResultsVC.init(results: results)
        let resultsNav = UINavigationController.init(rootViewController: resultsVC)
        self.present(resultsNav, animated: true, completion: nil)
        
    }
    
    func checkProgress() -> Float {
        // TODO: Check the current progress then
        if let index = questionIndex {
        return Float(index)/55.0
        } else {
            return 0.0
        }
    }
    
    /*********************************/
    // MARK: UI Element Controls
    /*********************************/
    
    func hideGroupOne() {
        // Hide Group 1 UI Elements
        nameField.isHidden          = true
        ageField.isHidden           = true
        weightField.isHidden        = true
        selectGenderLabel.isHidden  = true
        maleGenderButton.isHidden   = true
        femaleGenderButton.isHidden = true
    }
    
    func showGroupOne() {
        // Show Group 1 UI Elements
        nameField.isHidden          = false
        ageField.isHidden           = false
        weightField.isHidden        = false
        selectGenderLabel.isHidden  = false
        maleGenderButton.isHidden   = false
        femaleGenderButton.isHidden = false
    }
    
    func hideGroupTwo() {
        // Hide Group 2 UI Elements
        yesButton.isHidden = true
        noButton.isHidden  = true
    }

    func showGroupTwo() {
        // Show Group 2 UI Elements
        yesButton.isHidden = false
        noButton.isHidden  = false
        
    }
    
    func hideGroupThree() {
        // Hide Group 3 UI Elements
        oneButton.isHidden     = true
        twoButton.isHidden     = true
        threeButton.isHidden   = true
        fourButton.isHidden    = true
        //fiveButton.isHidden    = true
        epworthPrompt.isHidden = true
    }
    
    func showGroupThree() {
        // Show Group 3 UI Elements
        oneButton.isHidden     = false
        twoButton.isHidden     = false
        threeButton.isHidden   = false
        fourButton.isHidden    = false
        //fiveButton.isHidden    = false
        epworthPrompt.isHidden = false
    }
    
    /***************************************/
    // MARK: Questionairre Initializer Fuctions
    /***************************************/
    
    func setupView(forIndex:Int) {
        guard (forIndex <= 55) else {
            print("End of the rope! Trigger End Sequence!")
            
            // Hide all UIElements for the questionnaire
            hideGroupOne()
            hideGroupTwo()
            hideGroupThree()
            
            let a = UIAlertController.init(title: "Questionnaire Complete"  , message: "We've analyzed your responses and your results are ready. Tap \"View Results\" to see a summary.", preferredStyle: .alert)
            
            //a.view.backgroundColor = UIColor.blackColor()
            //a.view.tintColor = UIColor.blueColor()
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                // TODO: Change next button to "View Results"
                self.nextQuestionButton.setTitle("View Results", for: .normal)
            }
            
            a.addAction(okAction)
            
            self.present(a, animated: true, completion: nil)
            
            return
        }
        
        // TODO: This reinitializes the view when a new question shows up.
        
        // set the new progress bar value
        let newProgress = checkProgress()
        progressBar.setProgress(newProgress, animated: true)
        
        // reset responseRecorded and numberResponseRecorded
        responseRecorded = nil
        numberResponseRecorded = nil
        gender = nil
        nameField.text   = ""
        ageField.text    = ""
        weightField.text = ""
        
        
        // TODO: Set the title and description labels based off of the questionaire model class
        if (forIndex == 0) {
            titleLabel.text = "Let's Get Started"
        } else {
            let questionTitle = "Question " + String(forIndex)
            titleLabel.text = questionTitle
        }
      
        
        // Set the descriptions/prompts.
        let descriptionEntry  = QuestionnaireModel().promptArray[forIndex]
        descriptionLabel.text = descriptionEntry
        let epworthPromptText = QuestionnaireModel().epworthSleepPrompts[forIndex]
        epworthPrompt.text    = epworthPromptText
        
        let questionType = whatTypeOfQuestion(forIndex: forIndex)
        
        switch questionType {
        case .yesNo:
            print("It's a yes/no question")
            // Show Yes/Nos
            showGroupTwo()
            
            //Hide others
            hideGroupOne()
            hideGroupThree()
            
            // De-Highlight the Yes/No Buttons
            yesButton.setTitleColor(themeColor, for: .normal)
            yesButton.backgroundColor = UIColor.white
            noButton.setTitleColor(themeColor, for: .normal)
            noButton.backgroundColor = UIColor.white
            
        case .oneToFive:
            print("It's a 1-5 question")
            // Show 1-5s
            showGroupThree()
            
            // Hide Others
            hideGroupOne()
            hideGroupTwo()
            
            // De-Highlight all the numbers upon reset.
            let numberButtonArray = [oneButton, twoButton, threeButton, fourButton]//, fiveButton]
            
            for (index, object) in numberButtonArray.enumerated() {
                
                object?.backgroundColor = UIColor.white
                object?.setTitleColor(themeColor, for: .normal)
                
            }
        case .other:
            print("It's an other question")
            // This should show the intro view
            showGroupOne()
            
            // Hide Others
            hideGroupTwo()
            hideGroupThree()
        }
    }
    
    func whatTypeOfQuestion(forIndex:Int) -> QuestionType {
        // TODO: Set this up to correctly represent the questionnaire questions.
        
        switch forIndex {
        case 0:
            return QuestionType.other
        case 1...48:
            return QuestionType.yesNo
        case 49...56:
            return QuestionType.oneToFive
        default:
            return QuestionType.other
        }
    }
    
    
    /*****
     ************ MARK:Questionnaire Navigators *****************
     *****/
    
    @IBAction func tappedNext(_ sender: Any) {
        print("Tapped Next")
        guard (questionIndex! <= 55) else {
            print("Present the results view modally!!")
            
            let analyzer = QuestionnaireAnalyzer()
            let results = analyzer.analyzeQuestionnaireResults()
            
            let resultsVC = ResultsVC.init(results: results)
            let resultsNav = UINavigationController.init(rootViewController: resultsVC)
            self.present(resultsNav, animated: true, completion: nil)
            
            return
        }
        
        let questionType = whatTypeOfQuestion(forIndex: questionIndex!)
        
                
        if (questionType == .yesNo) {
            if let responseRecorded = responseRecorded {
                
                print("Recording the response")
                // Record the response
                recordBoolAnswer(forQuestionIndex: questionIndex!, withResponse: responseRecorded)
                    
                // TODO: UNLESS the index is > 40 (or whatever the last question is)...trigger the end sequence in this case!
                questionIndex! += 1
                UserDefaults.standard.set(questionIndex!, forKey: questionIndexKey)
                setupView(forIndex: questionIndex!)
                
            } else {
                // TODO: No Response Recorded yet, tell user to record a response with an alert.
                print("no response recorded ever")
                // Popup Alert
            }
        } else if (questionType == .oneToFive) {
            if let numberResponse = numberResponseRecorded {
                
                recordNumberAnswer(forQuestionIndex: questionIndex!, withResponse: numberResponse)

                // TODO: UNLESS the index is > 40 (or whatever the last question is)...trigger the end sequence in this case!
                questionIndex! += 1
                UserDefaults.standard.set(questionIndex!, forKey: questionIndexKey)
                setupView(forIndex: questionIndex!)
                
            } else {
                // TODO: No Response Recorded Yet, tell user to record a response with an alert.
                // Popup Alert
            }
        } else if (questionType == .other) {
            
            if ((nameField.text != "") &&
                (ageField.text != "") &&
                (weightField.text != "") &&
                (gender != nil)) {
                // All user data is entered, log it.
                recordIntroUserData()
                

                // ...then increment the question index and set up the view for the next question.
                
                // TODO: UNLESS the index is > 40 (or whatever the last question is)...trigger the end sequence in this case!
                questionIndex! += 1
                setupView(forIndex: questionIndex!)
                
            } else {
                print("Missing some user info")
                //TODO: Present Popup telling user to make sure all info is entered
            }
        }
    }
    
    @IBAction func tappedPrevious(_ sender: Any) {
        print("Tapped previous question button")
    }
    
    
    
    /*****
     ************ MARK: Intro UI Interaction *****************
     *****/
    
    @IBAction func tappedMaleButton(_ sender: Any) {
        gender = Gender.male
        
        // Highlight Male Button
        maleGenderButton.setTitleColor(UIColor.white, for: .normal)
        maleGenderButton.backgroundColor = themeColor
        
        // De-Highlight Female Button
        femaleGenderButton.setTitleColor(themeColor, for: .normal)
        femaleGenderButton.backgroundColor = UIColor.white
    }
    
    @IBAction func tappedFemaleButton(_ sender: Any) {
        gender = Gender.female
        
        // Highlight Female Button
        femaleGenderButton.setTitleColor(UIColor.white, for: .normal)
        femaleGenderButton.backgroundColor = themeColor
        
        // De-Highlight Male Button
        maleGenderButton.setTitleColor(themeColor, for: .normal)
        maleGenderButton.backgroundColor = UIColor.white
        
        responseRecorded = false
    }

    
    
    /***
     ************ MARK: Yes/No UI interaction *****************
     ***/
    
    
    @IBAction func tappedYes(_ sender: Any) {
        print("Tapped Yes")
        // Highlight Yes Button
        yesButton.setTitleColor(UIColor.white, for: .normal)
        yesButton.backgroundColor = themeColor
        
        // De-Highlight No Button
        noButton.setTitleColor(themeColor, for: .normal)
        noButton.backgroundColor = UIColor.white
        
        responseRecorded = true
        
    }
    @IBAction func tappedNo(_ sender: Any) {
        print("Tapped No")
        // Highlight No Button
        noButton.setTitleColor(UIColor.white, for: .normal)
        noButton.backgroundColor = themeColor
        
        // De-Highlight Yes Button
        yesButton.setTitleColor(themeColor, for: .normal)
        yesButton.backgroundColor = UIColor.white
        
        responseRecorded = false
    }
    
    
    /***
     ************ MARK: 1-5 UI interaction *****************
     ***/
    
    @IBAction func tappedOneButton(_ sender: Any) {
        
        numberResponseRecorded = 1
        
        // Highlight 1
        oneButton.setTitleColor(UIColor.white, for: .normal)
        oneButton.backgroundColor = themeColor
        
        // De-Highlight Other Buttons
        let numberButtonArray = [twoButton, threeButton, fourButton]//, fiveButton]
        
        for (index, object) in numberButtonArray.enumerated() {
            object?.backgroundColor = UIColor.white
            object?.setTitleColor(themeColor, for: .normal)
        }
    }
    
    @IBAction func tappedTwoButton(_ sender: Any) {
        
        numberResponseRecorded = 2
        
        // Highlight 2
        twoButton.setTitleColor(UIColor.white, for: .normal)
        twoButton.backgroundColor = themeColor
        
        // De-Highlight Other Buttons
        let numberButtonArray = [oneButton, threeButton, fourButton]//, fiveButton]
        
        for (index, object) in numberButtonArray.enumerated() {
            
            object?.backgroundColor = UIColor.white
            object?.setTitleColor(themeColor, for: .normal)
            
        }
    }
    
    @IBAction func tappedThreeButton(_ sender: Any) {
        
        numberResponseRecorded = 3
        
        // Highlight 3
        threeButton.setTitleColor(UIColor.white, for: .normal)
        threeButton.backgroundColor = themeColor

        // De-Highlight Other Buttons
        let numberButtonArray = [oneButton, twoButton, fourButton]//, fiveButton]
        
        for (index, object) in numberButtonArray.enumerated() {
            
            object?.backgroundColor = UIColor.white
            object?.setTitleColor(themeColor, for: .normal)
            
        }
    }

    @IBAction func tappedFourButton(_ sender: Any) {
        
        numberResponseRecorded = 4
        
        // Highlight 4
        fourButton.setTitleColor(UIColor.white, for: .normal)
        fourButton.backgroundColor = themeColor
        
        // De-Highlight Other Buttons
        let numberButtonArray = [oneButton, twoButton, threeButton]//, fiveButton]
        
        for (index, object) in numberButtonArray.enumerated() {
            
            object?.backgroundColor = UIColor.white
            object?.setTitleColor(themeColor, for: .normal)
            
        }
    }
    
    @IBAction func tappedFiveButton(_ sender: Any) {
        // TODO: DEPRECATED - The 5 button was removed. After testing this will be OK to delete.
        
        numberResponseRecorded = 5
        
        // Highlight 5
        fiveButton.setTitleColor(UIColor.white, for: .normal)
        fiveButton.backgroundColor = themeColor
        
        // De-Highlight Other Buttons
        let numberButtonArray = [oneButton, twoButton, threeButton, fourButton]
        
        for (index, object) in numberButtonArray.enumerated() {
            
            object?.backgroundColor = UIColor.white
            object?.setTitleColor(themeColor, for: .normal)
            
        }
        
    }
    
    
    
    /*****
     ************ MARK: Response Recorders *****************
     *****/
    
    
    func recordBoolAnswer(forQuestionIndex:Int, withResponse:Bool) {
        // Records a Bool response to User Defaults
        let questionIndexKey = "question" + String(forQuestionIndex) + "Response"
        print("questionIndexKey:", questionIndexKey)
        
        UserDefaults.standard.set(withResponse, forKey: questionIndexKey)
    }
    
    func recordNumberAnswer(forQuestionIndex:Int, withResponse:Int) {
        // Records an Int response to User Defaults
        let questionIndexKey = "question" + String(forQuestionIndex) + "Response"
        print("questionIndexKey:", questionIndexKey)
        
        UserDefaults.standard.set(withResponse, forKey: questionIndexKey)
    }
    
    func recordIntroUserData() {
        // Stores the user's intro info to User Defaults

        let defaults = UserDefaults.standard
            
        defaults.set(nameField.text, forKey: userNameKey)
        defaults.set(ageField.text, forKey: userAgeKey)
        defaults.set(weightField.text, forKey:userWeightKey)
        if (gender == Gender.male) {
            // In the user defaults, Male   = 1
            //                       Female = 0
            // User is male
            defaults.set(true, forKey: userGenderKey)
        } else {
            // User is female
            defaults.set(false, forKey: userGenderKey)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

enum QuestionType {
    case yesNo
    case oneToFive
    case other
}

enum Gender {
    case male
    case female
}
