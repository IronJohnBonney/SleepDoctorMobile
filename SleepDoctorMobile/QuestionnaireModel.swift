//
//  QuestionnaireModel.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 4/18/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit

struct FlashCard {
    let title:String
    let description:String
}

class FlashCardModel {
    
    // The disorder array below is for building the list of disorder buttons that can be tapped to see the flash cards.
    let disorders = ["Sleep Apnea",
                     "Insomnia",
                     "Narcolepsy",
                     "Restless Leg Syndrome"]
    
    
    // The variables below set all of the flashcard text (front and back) for each of the sleep disorder detail views. For each disorder there are 4 cards.
    let sleepApneaCards = [FlashCard.init(title: "What is Sleep Apnea?",
                                          description: "Sleep Apnea is a condition where you stop breating for periods of time at night"),
                           FlashCard.init(title: "Treatment",
                                          description: "This is how you treat sleep apnea"),
                           FlashCard.init(title: "Risk Factors",
                                          description:"These are the factors that mean you may be at high risk of having sleep apnea"),
                           FlashCard.init(title: "Symptoms",
                                          description: "You may have a dry mouth at night, you may stop breathing at night, and you may saw logs.")]
    
    let insomniaCards   = [FlashCard.init(title: "What is Insomnia?",
                                          description: "Insomnia is a condition where you can't fall asleep at night."),
                           FlashCard.init(title: "Treatment",
                                          description: "This is how you treat insomnia"),
                           FlashCard.init(title: "Risk Factors",
                                          description:"These are the factors that mean you may be at high risk of having insomnia"),
                           FlashCard.init(title: "Symptoms",
                                          description: "Trouble falling asleep at night, daytime sleepiness.")]
    
    let narcolepsyCards = [FlashCard.init(title: "What is Narcolepsy?",
                                          description: "Narcolepsy is a condition where you fall asleep uncontrollably during waking hours."),
                           FlashCard.init(title: "Treatment",
                                          description: "This is how you treat narcolepsy"),
                           FlashCard.init(title: "Risk Factors",
                                          description:"These are the factors that mean you may be at high risk of having narcolepsy"),
                           FlashCard.init(title: "Symptoms",
                                          description: "You may experience sudden fits of sleep, your muscles may go limp at times throughout the day.")]
    
    let rlsCards        = [FlashCard.init(title: "What is RLS?",
                                          description: "Restless Leg syndrome is a condition where you kick you can't stop moving your legs throughout the night."),
                           FlashCard.init(title: "Treatment",
                                          description: "This is how you treat RLS"),
                           FlashCard.init(title: "Risk Factors",
                                          description:"These are the factors that mean you may be at high risk of having RLS"),
                           FlashCard.init(title: "Symptoms",
                                          description: "You may experience an aching, crawling sensation in your legs as you fall asleep at night, an an inability to stop moving your legs.")]
    
    func allCards() -> [[FlashCard]] {
        let allCards = [sleepApneaCards, insomniaCards, narcolepsyCards, rlsCards]
        return allCards
    }
    
}

class QuestionnaireModel: NSObject {
    
    let promptArray:[String] = ["We'll start by collecting some basic information on you and your sleep patterns.",
                   // Sleep Apnea Questions                         1-12
                   "Have you been told that you snore?",
                   "Have you been told that you stop breathing when you sleep?",
                   "Do you have high blood pressure?",
                   "Do your friends and family say that you're grumpy and irritable?",
                   "Have you fallen asleep while driving?",
                   "Have you noticed your heart pounding or beating irregularly during the night?",
                   "Do you get morning headaches?",
                   "Do you suddenly wake gasping for breath?",
                   "Are you overweight?",
                   "Do you seem to be losing your sex drive?",
                   "Do you often feel sleepy and struggle to remain alert?",
                   "Do you frequently wake with a dry mouth?",
                   // Insomnia Questions                            13-19
                   "Do you have difficulty falling asleep?",
                   "Do thoughts race through your mind preventing you from sleeping?",
                   "Do you anticipate a problem with sleep several times a week?",
                   "Do you wake up and cannot fall back asleep?",
                   "Do you worry about things and have trouble relaxing?",
                   "Do you wake up earlier in the morning than you would like to?",
                   "Do you lie awake for half an hour or more before falling asleep?",
                   // Narcolepsy Questions                          20-27
                   "When you are or surprised, do you feel like your muscles go limp?",
                   "Do you often feel like you are in a daze?",
                   "Have you experienced vivid dreamlike sequences?",
                   "Have you fallen asleep in social settings such as the movies or at a party?",
                   "Do you have trouble at work because of sleepiness?",
                   "Do you have dreams soon after falling asleep or during naps?",
                   "Do you have \"sleep attacks\" during the day no matter how hard you try to stay awake?",
                   "Have you had episodes of feeling paralyzed during your sleep or on awakening?",
                   // Periodic Limb Movement Questions              28-34
                   "Other than when exercising, do you experience muscle tension in your legs?",
                   "Have you noticed (or have others commented) that parts of your body jerk during sleep?",
                   "Have you been told you kick at night?",
                   "When trying to go to sleep, do you experience an aching or crawling sensation in your legs?",
                   "Do you experience leg pain and cramps at night?",
                   "Can you sometimes not keep your legs still at night? Do you have to move them to feel comfortable?",
                   "Even though you slept during the night, do you feel sleepy during the day?",
                   // Parasomnia Questions                          35-38
                   "Do you act out your dreams while asleep?",
                   "Do you have frequent nightmares?",
                   "Do you talk in your sleep?",
                   "Have you sleep walked as an adult?",
                   // Sleep Hygiene Questions                       39-48
                   "Do you have pets in the bedroom?",
                   "Do you watch TV prior to sleeping?",
                   "Do you read in bed?",
                   "Do you drink alcohol prior to bedtime?",
                   "Do you smoke prior to bedtime or if you wake up during the night?",
                   "Do you eat a snack at bedtime?",
                   "Do you eat if you wake up during the night?",
                   "Do you sleep at anytime, without a fixed schedule?",
                   "Do you wake up at anytime, without a fixed schedule?",
                   "Do you take daytime naps?",
                   // Epworth Daytime Sleepiness Scale              49-56
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation.",
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation.",
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation.",
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation.",
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation.",
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation.",
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation.",
                   "How likely are you to fall asleep in the following situations, in contrast to feeling just tired? Using the following scale, select button 1-4 to indicate the most appropriate number for each situation."
                   ]
    
    let epworthSleepPrompts = ["",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "",
                               "Sitting and reading",
                               "Watching TV",
                               "Sitting, inactive in a public place (such as a theater or meeting",
                               "As a passenger in a car for an hour without a break",
                               "Lying down to rest in the afternoon",
                               "Sitting and talking with someone",
                               "Sititng quietly after a lunch without alcohol",
                               "In a car, while stopped for a few minutes in traffic"]
}

