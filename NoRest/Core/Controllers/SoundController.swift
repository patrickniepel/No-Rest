//
//  SoundController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import AVKit
import Foundation

struct SoundController {
    private static var audioPlayer: AVAudioPlayer?

    static func playTimerSound() {
        if SettingsController.isTimerSoundActivated {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "timerSound", ofType: "wav") ?? ""))
            } catch {}

            audioPlayer?.prepareToPlay()
            audioPlayer?.numberOfLoops = 0
            audioPlayer?.play()

            //            let generator = UINotificationFeedbackGenerator()
            //            generator.prepare()
            //            generator.notificationOccurred(.success)

            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
}
