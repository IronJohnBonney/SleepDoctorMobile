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
        // TODO: Pull all answers for insomnia questions, add up score
        
        //TODO: This needs to return true if they're at risk, false if not
        return true
    }
    
    fileprivate func analyzeInsomniaQuestions() -> Bool {
        // TODO: Pull all answers for insomnia questions, add up score
        
        //TODO: This needs to return true if they're at risk, false if not
        return false
    }
    
    fileprivate func analyzeRLSResponses() -> Bool {
        // TODO: Pull all answers for RLS Questions, add up score, return true if they have it, else false
        
        //TODO: This needs to return true if they're at risk, false if not
        return true
    }
    
    fileprivate func analyzeNarcolepsyResponses() -> Bool {
        
        //TODO: This needs to return true if they're at risk, false if not
        return true
    }
    
    fileprivate func analyzeNumberSurvey() {
        // TODO: Analyze the daytime sleepiness and return something
    }
}
