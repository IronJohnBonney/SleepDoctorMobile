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
                                          description: "When someone stops breathing during sleep, it is called sleep apnea. It is of two types. Central and Obstructive."),
                           FlashCard.init(title: "Why is sleep apnea important?",
                                          description: "In Obstructive sleep apnea, there is no air flow but effort for breathing is still there. In Central sleep apnea, there is no air flow and there is no effort for breathing. The signal that normally comes from the brain to the respiratory muscle to breathe is missing."),
                           FlashCard.init(title: "How would I know I have sleep apnea?",
                                          description:"You can fill out out questionnaire to find out if you are at risk of having sleep apnea."),
                           FlashCard.init(title: "Why should I care if I have sleep apnea?",
                                          description: "One third of our life time is spent in sleeping. This is the time when your brain recovers and certain essential function are performed which are not possible while you are awake. Sleep Apnea disrupts this sleep cycle."),
                           FlashCard.init(title: "Why does it matter if I have sleep apnea?",
                                          description:"Daytime fatigue, morning headaches, increased risk of motor vehicle accidents, mood changes and depression, memory problems and dementia, inability to focus and concentrate, obesity, increased risk of infections by lowering immunity, high blood pressure, heart attack, stroke, arrhythmia, poor control of blood sugars in patients with diabetes."),
                           FlashCard.init(title: "How is sleep apnea diagnosed?",
                                          description:"There are two ways to diagnose sleep apnea. It can be done either in your home setting or at our sleep laboratory. Which method is best for you depends on your medical condition and also on you medical insurance coverage as some insurances would not pay for laboratory based sleep testing until certain criteria are fulfilled."),
                           FlashCard.init(title: "How is sleep apnea treated?",
                                          description:"There are two main treatments of sleep apnea, positive airway pressure and Mandibular advancement device. In positive airway pressure, a machine blows air into your mouth/nose when you are asleep to keep airway open. A mandibular advancement device brings your lower jaw forward to open the air way in the back of your throat.")]
    
    let insomniaCards   = [FlashCard.init(title: "What is Insomnia?",
                                          description: "Insomnia is the most common sleep complaint. It occurs when you have trouble falling asleep or staying asleep even though you had the opportunity to get a full night of sleep. Insomnia may include difficulty falling asleep, difficulty staying asleep throughout the night, and waking up too early in the morning."),
                           FlashCard.init(title: "What are symptoms of Insomnia?",
                                          description: "Symptoms of Insomnia may include: fatigue, problems with attention, concentration or memory, poor performance at school or work, moodiness or irritability, daytime sleepiness, implusiveness or aggression, lack of energy or motivation, errors or accidents, concern or frustration about your sleep."),
                           FlashCard.init(title: "How is Insomnia treated?",
                                          description:"The treatment for insomnia depends on the underlying cause. You sleep doctor may recommend any combination of the following treatments: improvement of sleep hygiene, i.e. your daily bedtime habits and rituals; Cognitive Behavorial Therapy for Insomnia; Medications."),
                           FlashCard.init(title: "What is cognitive behavioral therapy for insomnia?",
                                          description: "Cognitive therapy teaches you to recognize and change beliefs that affect your ability to sleep. It helps you control or eliminate negative thoughts that keep you awake. Get out of bed and do something relaxing if you don’t fall asleep within about 20 minutes of turning in. The idea is to associate your bed with relaxation and comfort, not frustration and worry."),
                           FlashCard.init(title: "What are some techniques for cognitive behavioral therapy?",
                                          description: "There are six Main techniques that are integral part of cognitive behavioral therapy. These include: 1. Stimulus control therapy, 2. Sleep restriction, 3. Sleep Hygiene, 4. Sleep Relaxation, 5. Sleep Environment Improvement, 6. Biofeedback and paradoxical intention"),
                           FlashCard.init(title: "What is stimulus control therapy?",
                                          description: "Stimulus Control Therapy Rules: 1. Go to bed only when sleepy. 2. Do not watch television, read, eat, or worry while in bed. Use bed only for sleep and sex. 3. Get out of bed if unable to fall asleep within 20 minutes and go to another room. Return to bed only when sleepy. 4. Set an alarm clock to wake up at a fixed time each morning, including weekends. 5. Do not take a nap during the day."),
                           FlashCard.init(title: "What is sleep restriction?",
                                          description: "Sleep restriction therapy begins by decreasing the time spent in bed to the same amount of time that the patient reports sleeping (usually determined from sleep diaries or logs completed by the patient). It helps consolidate sleep and improves sleep efficiency."),
                           FlashCard.init(title: "What is sleep relaxation?",
                                          description: "Sleep relaxation helps to calm your mind and body. Yoga Nidra is a form of sleep meditation, which reduces the pressure to fall asleep and focuses on relaxing which helps you fall asleep. Please refer to our holistic relaxation techniques (add hyperlink if possible)."),
                           FlashCard.init(title: "What is paradoxical intention?",
                                          description: "This is when you try to force yourself to sleep, resulting in you being unable to fall asleep. Please remember that you cannot will yourself to sleep. Lie in the bed with the intention of staying awake and not falling asleep. This will take away the anxiety component which is preventing  you from falling asleep."),
                        ]
    
    let narcolepsyCards = [FlashCard.init(title: "What is Narcolepsy?",
                                          description: "Narcolepsy is a disorder of excessive daytime sleepiness with or without cataplexy, hypnagogic hallucinations, and sleep paralysis."),
                           FlashCard.init(title: "What are the symptoms of narcolepsy?",
                                          description: "Feeling sleepy during the day, falling asleep all of a sudden at inappropriate times, going weak when excited, angry, or laughing, Inability to move or speak in a few moments after waking up (sleep paralysis), seeing, feeling or hearing things that are not there in a few moments before falling asleep or right after waking up (hypnogogic or hypnopompic hallucinations."),
                           FlashCard.init(title: "What is Cataplexy?",
                                          description:"Cataplexy is emotionally-triggered transient muscle weakness. Most episodes are triggered by strong, generally positive emotions such as laughter, joking, or excitement. Episodes may also be triggered by anger or grief in some individuals. The weakness usually resolves in less than two minutes."),
                           FlashCard.init(title: "What are Hypnogogic Hallucinations?",
                                          description: "Hypnogogic Hallucinations are vivid, often frightening visual, tactile, or auditory hallucinations that occur as the patient is falling asleep. They probably result from a mixture of wakefulness and the dreaming of rapid eye movement (REM) sleep (Sleep is divided into REM and Non-REM Sleep)."),
                           FlashCard.init(title: "What are Hypnopompic Hallucinations?",
                                          description: "Hypnopompic hallucinations are similar to hypnogogic hallucinations, but they occur upon awakening; they can also occur in narcolepsy, but are less common."),
                           FlashCard.init(title: "What is Sleep Paralysis?",
                                          description: "Sleep paralysis is the complete inability to move for one or two minutes immediately after awakening. It may also occur just before falling asleep. Episodes of sleep paralysis can be frightening because the immobility may be accompanied by hypnopompic hallucinations or a sensation of suffocation."),
                           FlashCard.init(title: "What causes Narcolepsy?",
                                          description: "Loss of orexin (hypocretin) signaling, genetic factors, and rare brain lesions can cause narcolepsy."),
                           FlashCard.init(title: "How is Narcolepsy diagnosed?",
                                          description: "If your doctor suspects you have narcolepsy, he or she might send you for a sleep study. For the study you go to sleep lab where your body function and sleep is monitored. It is followed by a daytime test called the nap test."),
                           FlashCard.init(title: "How is Narcolepsy treated?",
                                          description: "Narcolepsy is treated with behavioral strategies and medications. People with the disorder should: keep a regular sleep schedule, make sure they get enough sleep at night, take naps just before important events and at scheduled times during the day, and avoid medicines that can make people sleepy, such as some allergy medicines."),
                           FlashCard.init(title: "What are the medications to treat narcolepsy?",
                                          description: "Stimulants are used to keep patients awake during the day.  In addition, there are medications that suppress REM sleep and help with cataplexy. Nighttime medications consolidate sleep and minimize awakenings, thus providing restful sleep.")]
    
    
    
    
    let rlsCards        = [FlashCard.init(title: "What is Restless Leg Syndrome (RLS)?",
                                          description: "RLS is an unpleasant or uncomfortable urge to move the legs that occurs during periods of inactivity, particularly in the evenings, and is transiently relieved by movement. During sleep, most patients with RLS have characteristic limb movements, called periodic limb movements of sleep (PLMS), which can be be associated with arousal from sleep."),
                           FlashCard.init(title: "How would I know I have Restless Leg Syndrome?",
                                          description: "Take our questionnaire to find out if you show symptoms of RLS."),
                           FlashCard.init(title: "Why should I care if I have Restless Leg Syndrome?",
                                          description:"RLS can lead to sleep-onset insomnia, nocturnal awakenings, depression, and anxiety."),
                           FlashCard.init(title: "What causes Restless Leg Syndrome?",
                                          description: "It is still not fully understood as to what causes RLS but we know that it tends to run in the families, about 40% of patients have genetic predisposition with genes involved in Dopamine (one of the chemical in the brain) metabolism. It is also associated with low iron stores in your brain."),
                           FlashCard.init(title: "What are other factors associated with Restless Leg Syndrome?",
                                          description:"Neuropathy (nerve disease), pregnancy, low iron stores, Chronic Kidney Disease, some medications that can worsen RLS: (Tricyclic medications, SSRI, used to treat Depression, can make it worse, Benadryl, and Metoclopramide, an anti-nausea medication)."),
                           FlashCard.init(title: "What is Periodic Limb Movement Disorder (PLMD) and how is it different from RLS?",
                                          description: "Limb movements occurring at certain intervals during sleep associated with sleep disturbance resulting in daytime fatigue is the main feature of PLMD. RLS leads to difficulty with going to sleep whereas PLMD leads to unrefreshing sleep. About 80% of the patients with RLS have Periodic limb movements where as 30% of the patients with PLMD have RLS."),
                           FlashCard.init(title: "How do you treat Restless Leg Syndrome?",
                                          description: "RLS can be helped with behavioral/life style changes and with use of the medications. It is always advisable to start with behavioral changes and if desired results are not obtained add a medication to help with the symptoms."),
                           FlashCard.init(title: "Behavioral/Lifestyle Change Strategies", description: "Moderate regular exercise like walking for 30-45 min. before the start of symptoms, mentally alerting activities at times of rest or boredom such as working on a computer or doing crossword puzzles, reduced caffeine intake, short daily hemodialysis for patients with end-stage renal disease is also helpful."),
                           FlashCard.init(title:"What medications can be used for treatment?",
                                          description: "Dopamine medications: Pramipexole, Ropinrole, Levodopa; Alpha-2-Delta calcium channel ligands: Pregabalin, Gabapentin Enacarbil; Benzodiazepines; Opioids; Others: Depakote, Carbamazepine")]
    
    
    let parasomniaCards = [FlashCard.init(title: "What is a Parasomnia?",
                                          description: "Parasomnias are a group of sleep disorders that involve unwanted events or experiences that occur while falling asleep, sleeping or waking up, including abnormal movements, behaviors, emotions, perceptions or dreams. Although the behaviors may be complex and appear purposeful to others, you remain asleep during the event and often have no memory that it occurred."),
                           FlashCard.init(title: "What are some examples of a Parasomnia?",
                                          description: "Sleepwalking, Confusional Arousals, Sleep Terrors, Sleep Eating Disorder, REM Sleep Behavior Disorder, Nightmare Disorder, Sleep Paralysis, Bedwetting (Enuresis), Sleep Hallucinations, Exploding Head Syndrome and Sleep Talking."),
                           FlashCard.init(title: "How are Parasomnia diagnosed?",
                                          description:"The Parasomnias are diagnosed by your sleep doctor on the basis of history, physical examination and diagnostic testing. If your sleep doctor suspects you have parasomnia, he or she might send you for a sleep study. For the study, you go to a sleep lab where various body functions are monitored while you sleep at night."),
                           FlashCard.init(title: "How are Parasomnias treated?",
                                          description: "Parasomnias have diverse group of presentation and treatment is tailored to individual entity. It is generally involves combination of behavioral/Life style changes, rearranging the bedroom/house and medications to suppress this activity and treating the sleep disorder to minimize this behavior.")]
    
    let sleepHygieneCards = [FlashCard.init(title: "What is Sleep Hygiene?",
                                            description: "Sleep hygiene refers to your nighttime habits that affect your quality of sleep."),
                             FlashCard.init(title: "Improvement Tip #1",
                                            description: "Try to go to bed only when you feel drowsy."),
                             FlashCard.init(title: "Improvement Tip #2",
                                            description:"Have a fixed schedule: a fixed time to go to sleep and a fixed time to get up."),
                             FlashCard.init(title: "Improvement Tip #3",
                                            description: "Use your bedroom only for sleep and sex."),
                             FlashCard.init(title: "Improvement Tip #4",
                                            description: "Increase the amount of exercise you do, but do not do it one hour before bedtime."),
                             FlashCard.init(title: "Improvement Tip #5",
                                            description: "Avoid caffeine for at least six to eight hours before bedtime."),
                             FlashCard.init(title: "Improvement Tip #6",
                                            description: "Establish a nighttime ritual or a time to unwind."),
                             FlashCard.init(title: "Improvement Tip #7",
                                            description: "Try a warm bath, deep breathing techniques, yoga nidra or meditation techniques to help you relax."),
                             FlashCard.init(title: "Improvement Tip #8",
                                            description: "Don’t try to will yourself to sleep; that is counterproductive. It makes you all the more stressed about going to sleep and keeps you awake."),
                             FlashCard.init(title: "Improvement Tip #9",
                                            description: "Don’t spend too much time in bed. If you are not able to fall asleep in 15 minutes, get out of bed and read a book or do something that is non-stimulating."),
                             FlashCard.init(title: "Improvement Tip #10",
                                            description: "Avoid alcohol near bedtime (eg, late afternoon and evening)"),
                             FlashCard.init(title: "Improvement Tip #11",
                                            description: "Avoid smoking or other nicotine intake, particularly during the evening."),
                             FlashCard.init(title: "Improvement Tip #12",
                                            description: "Adjust the bedroom environment as needed to decrease stimuli (eg, reduce ambient light, turn off the television or radio)."),
                             FlashCard.init(title: "Improvement Tip #13",
                                            description: "Avoid prolonged use of light-emitting screens (laptops, tablets, smartphones, ebooks) before bedtime)."),
                             FlashCard.init(title: "Improvement Tip #14",
                                            description: "Resolve concerns or worries before bedtime. Maintain a worry journal to write your worries and acknowledge you will get back to looking for solutions the following day"),
                             FlashCard.init(title: "Improvement Tip #15",
                                            description: "Avoid daytime naps, especially if they are longer than 20 to 30 minutes or occur late in the day.")]
    
    func allCards() -> [[FlashCard]] {
        let allCards = [sleepApneaCards, insomniaCards, narcolepsyCards, rlsCards, parasomniaCards]
        return allCards
    }
    
}
