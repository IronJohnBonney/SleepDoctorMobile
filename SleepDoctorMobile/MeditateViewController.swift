//
//  MeditateViewController.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 3/22/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit
import LNPopupController

class MeditateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var trackTableView: UITableView!
    
    let trackNames        = ["Yoga Nidra",
                             "Mindful Deep Breathing",
                             "Mantra Meditation",
                             "Massage Relaxation"]
    
    let trackDescriptions = ["Guided Meditation for Relaxation before Sleep",
                             "A Deep Breathing Meditation Technique",
                             "Traditional Indian Mantra Meditation",
                             "A Massage Muscle Relaxation Technique"]
    
    // The following stream strings will be passed to the music player to initialize the player with
    // a certain mp3.
    let streamStrings     = ["https://s3.amazonaws.com/sleep-doctor-mobile/Yoga-Nidra.mp3",
                             "https://s3.amazonaws.com/sleep-doctor-mobile/Mindful-Deep-Breathing.mp3",
                             "https://s3.amazonaws.com/sleep-doctor-mobile/Mantra-Meditation.mp3",
                             "https://s3.amazonaws.com/sleep-doctor-mobile/Massage-Relaxation.mp3"]
    
    let trackImages = [#imageLiteral(resourceName: "Moonrise-BGImage"),
                       #imageLiteral(resourceName: "NightSky-BGImage"),
                       #imageLiteral(resourceName: "Hillside-BGImage"),
                       #imageLiteral(resourceName: "Waterfall-BGImage")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        // Register to receive the playerDidStartPlaying notification
        NotificationCenter.default.addObserver(self, selector: #selector(MeditateViewController.playerDidStartPlaying), name: NSNotification.Name(rawValue: "PlayerDidStartPlayingTrackNotification"), object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButtonTapped(_ sender: AnyObject) {
        print("Play Button Tapped in a row! Yeehaw")
        
        // TODO: Grab the row of the tapped button, then get the stream string of the corresponding row
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.trackTableView)
        let indexPath = self.trackTableView.indexPathForRow(at: buttonPosition)
        
        // TODO: Integrate the new LNPopup View thingy
        
        
        // View Setup
        
        // Create a content controller
        let musicController = MusicPlayerViewController.shared
        
        print("PRE popupPresentationState", musicController.popupPresentationState.rawValue)
        
        //musicController.popupBar.barTintColor = UIColor.black
        //musicController.popupBar.backgroundColor = UIColor(colorLiteralRed: 32/255.0, green: 66/255.0, blue: 162/255.0, alpha: 1.0)
        //musicController.popupBar.backgroundStyle = UIBlurEffectStyle.dark
        /*
        musicController.popupBar.barStyle = LNPopupBarStyle.compact
        musicController.popupBar.barTintColor = UIColor(colorLiteralRed: 32/255.0, green: 66/255.0, blue: 162/255.0, alpha: 1.0)
        musicController.popupBar.backgroundColor = UIColor(colorLiteralRed: 32/255.0, green: 66/255.0, blue: 162/255.0, alpha: 1.0)
        
        musicController.popupItem.title = trackNames[(indexPath?.row)!]
        musicController.popupItem.subtitle = trackDescriptions[(indexPath?.row)!]
        musicController.popupItem.progress = 0.34
        
        self.navigationController?.popupInteractionStyle = .drag
        
        self.navigationController?.presentPopupBar(withContentViewController: musicController, animated: true, completion: {
            print("POST popupPresentationState", musicController.popupPresentationState.rawValue)
        })        
        */
        
        // Player Setup
        
        print(indexPath)
        
        MusicPlayer.shared.playSong(withName:trackNames[(indexPath?.row)!],
                                    description:trackDescriptions[(indexPath?.row)!],
                                    image:trackImages[(indexPath?.row)!],
                                    URLString: streamStrings[(indexPath?.row)!])

        
        /*
        // TODO: Test adding the Music Bar VC to start.
        let musicBar = MusicBarVC()
        var musicBarFrame = musicBar.view.frame
        
        // Try setting the Music Bar frame here
        musicBarFrame.size.width = self.view.bounds.size.width
        //musicBarFrame.origin = CGPoint(x: 0.0, y: (self.view.frame.size.height - 80.0))
        musicBar.view.frame = CGRect(x: 0.0, y: (self.view.bounds.size.height - 82.0), width: musicBarFrame.size.width, height: musicBarFrame.size.height)
        
        // Create a container view
        let container = UIView(frame: musicBarFrame)
        
        // CGRect(0.0, (self.view.frame.size.height - 80.0), musicBarFrame.size.width, musicBarFrame.size.height)
        
        //musicBarFrame.origin.x = 0.0
        //musicBarFrame.origin.y = (self.view.frame.size.height - 80.0)
        
        print("self.view.frame.size.height: ", self.view.bounds.size.height)
        
        if let barView = musicBar.viewIfLoaded {
            print("BarView is loaded!")
            container.addSubview(barView)
            //self.view.addSubview(barView)
            //self.view.bringSubview(toFront: barView)
            
            //addChildViewController(musicBar)
            UIApplication.shared.keyWindow?.addSubview(container)
            
            //musicBar.didMove(toParentViewController: self)
            
        }
        */
        
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.frame.height - 100)/4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath)

        // Configure the cell...
        let trackNameLabel = cell.viewWithTag(1) as! UILabel
        trackNameLabel.text = trackNames[indexPath.row]
        
        let descriptionLabel = cell.viewWithTag(2) as! UILabel
        descriptionLabel.text = trackDescriptions[indexPath.row]
        
        let backgroundColor = UIColor.init(patternImage: trackImages[indexPath.row])
        cell.backgroundColor = backgroundColor
        
        let playButton = cell.viewWithTag(3) as! UIButton
        playButton.addTarget(self, action: #selector(MeditateViewController.playButtonTapped(_:)), for: .touchUpInside)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    // MARK: Notification Handler
    func playerDidStartPlaying() {
        print("Player did start playing MeditateViewController!")
        // Present the popup
        self.navigationController?.presentPopupBar(withContentViewController: MusicPlayerViewController.shared, animated: true, completion: {
            print("Did present the player on the Meditate ViewController!")
        })
    }
    

}
