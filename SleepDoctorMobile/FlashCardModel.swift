//
//  FlashCardModel.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 5/31/17.
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
                                          description: "You may have a dry mouth at night, you may stop breathing at night, and you may saw logs."),
                           FlashCard.init(title: "Card 5",
                                          description:"Here is a description for card 5"),
                           FlashCard.init(title: "Card 6",
                                          description:"Here is a description for card 6"),
                           FlashCard.init(title: "Card 7",
                                          description:"Here is a description for card 7"),
                           FlashCard.init(title: "Card 8",
                                          description:"Here is a description for card 8"),
                           FlashCard.init(title: "Card 9",
                                          description:"Here is a description for card 9"),
                           FlashCard.init(title: "Card 10",
                                          description:"Here is a description for card 10")]
    
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
    
    let parasomniaCards = [FlashCard.init(title: "What is Parasomnia?",
                                          description: "Parasomnia is a condition where you lfrequently expereince to vivid dream sequences."),
                           FlashCard.init(title: "Treatment",
                                          description: "This is how you treat parasomnia"),
                           FlashCard.init(title: "Risk Factors",
                                          description:"These are the factors that mean you may be at high risk of having parasomnia"),
                           FlashCard.init(title: "Symptoms",
                                          description: "You may experience wild dreamlike sequences and stuff.")]
    
    let sleepHygieneCards = [FlashCard.init(title: "What is Sleep Hygiene?",
                                            description: "Sleep hygiene refers to your nighttime habits that affect your quality of sleep."),
                             FlashCard.init(title: "Improvement",
                                            description: "This is how you improve your sleep hygiene"),
                             FlashCard.init(title: "What affects sleep hygiene?",
                                            description:"These are things that affect the quality of sleep hygiene, such as pets in the room, smoking in bed, and watching TV before falling asleep."),
                             FlashCard.init(title: "Symptoms",
                                            description: "You may experience daytime sleepiness and a feeling of never being fully rested.")]
    
    func allCards() -> [[FlashCard]] {
        let allCards = [sleepApneaCards, insomniaCards, narcolepsyCards, rlsCards, parasomniaCards]
        return allCards
    }
    
}
