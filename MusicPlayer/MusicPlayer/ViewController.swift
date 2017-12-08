//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Yudhvir Raj on 2017-12-08.
//  Copyright © 2017 Yudhvir Raj. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var songPlayer    = AVAudioPlayer()
    var hasBeenPaused = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSongAndSession()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareSongAndSession() {
        do {
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "New Person Same Old Mistakes", ofType: "mp3")!))
            
            songPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch let sessionError {
                print(sessionError)
            }
        } catch let songPlayerError {
            print (songPlayerError)
        }
    }


    @IBAction func play(_ sender: UIBarButtonItem) {
        songPlayer.play()
    }
    
    @IBAction func pause(_ sender: UIBarButtonItem) {
        if songPlayer.isPlaying {
            songPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false
        }
    }
    
    @IBAction func restart(_ sender: UIBarButtonItem) {
        if songPlayer.isPlaying || hasBeenPaused {
            songPlayer.stop ()
            songPlayer.currentTime = 0
            songPlayer.play()
        } else {
            songPlayer.play()
        }
    }
}

