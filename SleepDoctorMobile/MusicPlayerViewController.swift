//
//  MusicPlayerViewController.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 3/22/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit
import LNPopupController

class MusicPlayerViewController: UIViewController, MusicPlayerDelegate {

    static let shared: MusicPlayerViewController = MusicPlayerViewController()
    
    
    @IBOutlet weak var trackProgressBar: UIProgressView!
    @IBOutlet weak var trackProgressSlider: UISlider!
    
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackDescriptionLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var playButtonBorderView: UIView!
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    
    
    
    var isPlaying = true // TODO: *Consider having this Bool live in the AVPlayer class
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Configure the popup view
        
    }
    
    @IBAction func tappedTopControl(_ sender: Any) {
        print("dismissing the music player view")
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func tappedPlayButton(_ sender: Any) {
        
        print("TappedPlay")
        MusicPlayer.shared.togglePlayOrPause()
        
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
    
    // MARK: Music Player Delegate
    
    func didStartPlayingNewTrack(withName:String, description:String, image:UIImage, duration:Float) {
        
        // TODO: This is where I need to initialize or update the popupItem
        self.popupBar.barStyle = LNPopupBarStyle.compact
        self.popupBar.barTintColor = UIColor(colorLiteralRed: 32/255.0, green: 66/255.0, blue: 162/255.0, alpha: 1.0)
        self.popupBar.backgroundColor = UIColor(colorLiteralRed: 32/255.0, green: 66/255.0, blue: 162/255.0, alpha: 1.0)
        
        self.popupItem.title = withName
        self.popupItem.subtitle = description
        self.popupItem.progress = 0.34

        //self.popupItem.rightBarButtonItems = [UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.camera, target: MusicPlayer.shared, action: #selector(MusicPlayer.togglePlayOrPause))]
        
        
        self.popupItem.rightBarButtonItems = [UIBarButtonItem.init(image: #imageLiteral(resourceName: "Pause-Button-White-BBI"), style: .plain, target: MusicPlayer.shared, action: #selector(MusicPlayer.togglePlayOrPause))]
        
        /*
        self.navigationController?.popupInteractionStyle = .drag
        
        self.navigationController?.presentPopupBar(withContentViewController: musicController, animated: true, completion: {
            print("POST popupPresentationState", musicController.popupPresentationState.rawValue)
        })
*/
        
        //TODO: Post a notification telling whatever view is active to present the popup on the Nav Controller.
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"PlayerDidStartPlayingTrackNotification"), object: self)
        
        self.trackNameLabel.text = withName
        self.trackDescriptionLabel.text = description
        self.trackImage.image = image
        self.trackImage.layer.cornerRadius = 12.0
        self.trackImage.layer.masksToBounds = true
        self.imageTitleLabel.text = withName
        
        // Set the max value of the slider to the number of seconds in the track
        self.trackProgressSlider.maximumValue = duration
        
    }
    
    func didUpdateProgress(withFloat:Float) {
        self.trackProgressBar.progress = withFloat
        self.trackProgressSlider.value = withFloat
        self.popupItem.progress = (withFloat/self.trackProgressSlider.maximumValue)
    }
    
    func didPausePlayer(){
        // TODO: Set pause to play
        //self.playButton.setTitle("play", for: .normal)
        self.playButton.setImage(#imageLiteral(resourceName: "Play-Button-White"), for: .normal)
        
        // Set the popupitem's right bbi to the correct play/pause image
        self.popupItem.rightBarButtonItems = [UIBarButtonItem.init(image: #imageLiteral(resourceName: "Play-Button-White-BBI"), style: .plain, target: MusicPlayer.shared, action: #selector(MusicPlayer.togglePlayOrPause))]
    }
    
    func didPlayPlayer() {
        // TODO: Set play to pause
        //self.playButton.setTitle("pause", for: .normal)
        self.playButton.setImage(#imageLiteral(resourceName: "Pause-Button-White"), for: .normal)
        // Set the popupitem's right bbi to the correct play/pause image
        self.popupItem.rightBarButtonItems = [UIBarButtonItem.init(image: #imageLiteral(resourceName: "Pause-Button-White-BBI"), style: .plain, target: MusicPlayer.shared, action: #selector(MusicPlayer.togglePlayOrPause))]
    }
    
    @IBAction func didSlideSlider(_ sender: Any) {
        // Value changed
        
    }
    
    @IBAction func didMoveSlider(_ sender: Any) {
        // Touch Up Inside
        
        MusicPlayer.shared.seekToTime(withFloat:trackProgressSlider.value)
    }

}
