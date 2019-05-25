//
//  AudioPlayer.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation
import AVKit

struct AudioPlayer {
    
    static func playTimerSound() {
        if SettingsController.isTimerSoundActivated {
            
            var audioPlayer: AVAudioPlayer?
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "timerSound", ofType: "wav") ?? ""))
            }
            catch {
            }
            
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
    }
}
