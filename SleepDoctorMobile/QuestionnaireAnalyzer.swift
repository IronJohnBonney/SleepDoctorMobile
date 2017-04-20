//
//  QuestionnaireAnalyzer.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/18/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

class QuestionnaireAnalyzer: NSObject {
    
    var hasSleepApnea:Bool = false
    var hasInsomnia:Bool = false
    var hasRLS:Bool = false
    var hasNarcolepsy = false

    public func analyzeQuestionnaireResults() -> [Bool] {
        // TODO: This should return the sleep analysis, including which illnesses the user has. This will come in the form of an array of Bools.
        
        hasSleepApnea = analyzeSleepApneaQuestions()
        hasInsomnia = analyzeInsomniaQuestions()
        hasRLS = analyzeRLSResponses()
        hasNarcolepsy = analyzeNarcolepsyResponses()
        
        // Format: [sleepApnea, insomnia, RLS, narcolepsy]
        //TODO: Actually return value
        return [hasSleepApnea, hasInsomnia, hasRLS, hasNarcolepsy]
    }
    
    fileprivate func analyzeSleepApneaQuestions() -> Bool {
        // Insomnia Questions are 1-12
        // TODO: Pull all answers for insomnia questions, add up score
        var yesCount = 0
        
        for i in 1...12 {
            // Records a Bool response to User Defaults
            let questionIndexKey = "question" + String(i) + "Response"
            let questionResponse = UserDefaults.standard.bool(forKey: questionIndexKey)
            
            if (questionResponse == true) {
                yesCount += 1
            }
        }
        
        if (yesCount >= 3) {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func analyzeInsomniaQuestions() -> Bool {
        // Insomnia Questions are 1-12
        // TODO: Pull all answers for insomnia questions, add up score
        var yesCount = 0
        
        for i in 13...19 {
            // Records a Bool response to User Defaults
            let questionIndexKey = "question" + String(i) + "Response"
            let questionResponse = UserDefaults.standard.bool(forKey: questionIndexKey)
            
            if (questionResponse == true) {
                yesCount += 1
            }
        }
        
        if (yesCount >= 3) {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func analyzeNarcolepsyResponses() -> Bool {
        
        var yesCount = 0
        
        for i in 20...27 {
            // Records a Bool response to User Defaults
            let questionIndexKey = "question" + String(i) + "Response"
            let questionResponse = UserDefaults.standard.bool(forKey: questionIndexKey)
            
            if (questionResponse == true) {
                yesCount += 1
            }
        }
        
        if (yesCount >= 3) {
            return true
        } else {
            return false
        }

    }
    
    fileprivate func analyzeRLSResponses() -> Bool {
        
        var yesCount = 0
        
        for i in 28...34 {
            // Records a Bool response to User Defaults
            let questionIndexKey = "question" + String(i) + "Response"
            let questionResponse = UserDefaults.standard.bool(forKey: questionIndexKey)
            
            if (questionResponse == true) {
                yesCount += 1
            }
        }
        
        if (yesCount >= 3) {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func analyzeNumberSurvey() {
        // TODO: Analyze the daytime sleepiness and return something
        
        print("Analyzing Epworth Sleepiness scale derpaderrrrp")
    }
}
