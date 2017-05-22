//
//  QuestionnaireAnalyzer.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/18/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

struct QuestionnaireResults {
    var disorderArray:[Bool]
    var daytimeSleepinessScore:Int
}

class QuestionnaireAnalyzer: NSObject {
    
    var hasSleepApnea:Bool     = false
    var hasInsomnia:Bool       = false
    var hasRLS:Bool            = false
    var hasNarcolepsy          = false
    var hasParasomnia          = false
    var hasPoorSleepHygiene    = false
    var daytimeSleepinessScore = 0

    public func resetAllResponses() {
        let defaults = UserDefaults.standard
        for i in 1...56 {
            // Set all of these Response User Defaults to nil
            let questionIndexKey = "question" + String(i) + "Response"
            defaults.set(nil, forKey: questionIndexKey)
        }
    }
    
    public func analyzeQuestionnaireResults() -> [Bool] {
        // TODO: This should return the sleep analysis, including which illnesses the user has. This will come in the form of an array of Bools.
        
        hasSleepApnea          = analyzeSleepApneaResponses()
        hasInsomnia            = analyzeInsomniaResponses()
        hasRLS                 = analyzeRLSResponses()
        hasNarcolepsy          = analyzeNarcolepsyResponses()
        hasParasomnia          = analyzeParasomniaResponses()
        hasPoorSleepHygiene    = analyzeHygieneResponses()
        daytimeSleepinessScore = analyzeNumberSurvey()
        
        // Disorder Array Format: [sleepApnea, insomnia, RLS, narcolepsy]
        // TODO: Change the return type to a Questionnaire results struct
        return [hasSleepApnea, hasInsomnia, hasRLS, hasNarcolepsy]
    }
    
    fileprivate func analyzeSleepApneaResponses() -> Bool {
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
    
    fileprivate func analyzeInsomniaResponses() -> Bool {
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
    
    fileprivate func analyzeParasomniaResponses() -> Bool {
        
        var yesCount = 0
        
        for i in 35...38 {
            // Records a Bool response to User Defaults
            let questionIndexKey = "question" + String(i) + "Response"
            let questionResponse = UserDefaults.standard.bool(forKey: questionIndexKey)
            
            if (questionResponse == true) {
                yesCount += 1
            }
        }
        
        if (yesCount >= 2) {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func analyzeHygieneResponses() -> Bool {
        
        var yesCount = 0
        
        for i in 39...48 {
            // Records a Bool response to User Defaults
            let questionIndexKey = "question" + String(i) + "Response"
            let questionResponse = UserDefaults.standard.bool(forKey: questionIndexKey)
            
            if (questionResponse == true) {
                yesCount += 1
            }
        }
        
        if (yesCount >= 5) {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func analyzeNumberSurvey() -> Int {
        // TODO: Analyze the daytime sleepiness and return something
        
        print("Analyzing Epworth Sleepiness scale derpaderrrrp")
        var score = 0
        
        for i in 49...56 {
            // Records a Bool response to User Defaults
            let questionIndexKey = "question" + String(i) + "Response"
            let questionResponse = UserDefaults.standard.integer(forKey: questionIndexKey)
            
            score += questionResponse
        }
        
        // TODO: Need to consider making several ranges, or just returning the score out of 32, but maybe scale it from 1-100?
        return score
    }
}
