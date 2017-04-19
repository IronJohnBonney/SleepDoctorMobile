//
//  MusicPlayer.swift
//  SleepDoctorMobile
//
//  Created by Stephen Looney on 3/23/17.
//  Copyright © 2017 Spaceboat Development LLC. All rights reserved.
//

import UIKit
import AVFoundation

protocol MusicPlayerDelegate {
    func didStartPlayingNewTrack(withName:String,
                                 description:String,
                                 image:UIImage)
    func didUpdateProgress(withFloat:Float)
    func didPausePlayer()
    func didPlayPlayer()
}


/*
 * This class is a shared (singleton) music player that is used throughout the app to manage audio playback
 */

class MusicPlayer: AVQueuePlayer {
    
    static let shared: MusicPlayer = MusicPlayer()
    
    var delegate : MusicPlayerDelegate?
    
    var progressTimer:Timer? = nil
    let progress:Float = 0.0
    
    func setPlayerVolume(toValue:Float) {
        self.volume = toValue
    }
    
    func isPlaying() -> Bool {
        // If the rate is above 0 (player is playing), and there is no error, returns true, else false.
        return (self.rate > 0 && self.error == nil)
    }
    
    
    func newTrackMatchesCurrentTrack(withNewURLString: String) -> Bool {
        
        if let currentPlayerAsset = self.currentItem?.asset {
            guard (currentPlayerAsset.isKind(of: AVURLAsset.self)) else {
                // The current player asset is not of type AVURLAsset. There is no asset. There is no spoon.
                print("Current Player Asset is not AVURLAsset type")
                return false
            }
           
            print("Current Player Asset Found")
            
            print((currentPlayerAsset as? AVURLAsset)?.url.absoluteString ?? "No URL AbsoluteString!")
            let currentURLString = (currentPlayerAsset as? AVURLAsset)?.url.absoluteString
            
            // Now, check if the current string matches the current player's URL String
            
            switch withNewURLString {
            case currentURLString!:
                print("Matches")
                return true
            default:
                print("Doesn't match")
                return false
            }
            
        } else {
            print("There is no asset")
            return false
        }
    }
    
    func togglePlayOrPause() {
        if (self.isPlaying()) {
            self.pause()
            delegate?.didPausePlayer()
            stopUpdatingProgress()
        } else {
            self.play()
            delegate?.didPlayPlayer()
            startUpdatingProgress()
        }
    }
    
    func playSong(withName:String, description:String, image:UIImage, URLString:String) {
        // This function will take a URL as an argument and play the track
        print("PlaySong")
        if (self.isPlaying()) {
            // There is a track currently playing. Is it the same as the one being queued up?
            
            if (newTrackMatchesCurrentTrack(withNewURLString: URLString)) {
                // It's the same song
                print("You're trying to play the same song. Pause it.")
                self.pause()
                stopUpdatingProgress()
                delegate?.didPausePlayer()
                
            } else {
                print("queueing up a new track")
                // It's a new song - reset the MusicPlayer and play it
                self.removeAllItems()
                
                let trackURL = URL.init(string: URLString)
                if let trackURL = trackURL {
                    let playerItem = AVPlayerItem(url: trackURL)
                    self.insert(playerItem, after: nil)
                    self.play()
                    
                    delegate?.didStartPlayingNewTrack(withName: withName, description: description, image:image)
                    
                    startUpdatingProgress()
                }
            }
            
        } else {
            // Song is either not initialized, or paused.
            
            if (newTrackMatchesCurrentTrack(withNewURLString: URLString)) {
                // It's the same song
                print("You pressed play on the same song. Resume playing it.")
                self.play()
                
                startUpdatingProgress()
                
            } else {
                print("You pressed play on a new track")
                // It's a new song - reset the MusicPlayer and play it
                self.removeAllItems()
                
                let trackURL = URL.init(string: URLString)
                if let trackURL = trackURL {
                    let playerItem = AVPlayerItem(url: trackURL)
                    self.insert(playerItem, after: nil)
                    self.play()
                    
                    // Tell the delegate what song has started
                    MusicPlayerViewController.shared.didStartPlayingNewTrack(withName: withName, description: description, image:image)
                    
                    startUpdatingProgress()
                }
            }
        }
    }
    
    func configureMusicPlayerView() {
        // TODO: This function will configure the music player view and popup with all the correct information
    }
    
    func startUpdatingProgress() {
        progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(MusicPlayer.updateProgressValue), userInfo: nil, repeats: true)
        
    }
    
    func stopUpdatingProgress() {
        if let timer = progressTimer {
            timer.invalidate()
        }
    }
    
    func updateProgressValue() {
        print("Fired progress value")
        if let duration = self.currentItem?.asset.duration {
        let durationSeconds = CMTimeGetSeconds(duration)
        let currentSeconds = CMTimeGetSeconds(self.currentTime())
        let ratio = currentSeconds/durationSeconds
        
        delegate?.didUpdateProgress(withFloat: Float(ratio))
        } else {
            // There is likely no current item. Stop the timer from running.
            stopUpdatingProgress()
        }
    }
}
