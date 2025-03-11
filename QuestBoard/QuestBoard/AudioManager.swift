//
//  AudioManager.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 10/03/25.
//

import SwiftUI
import AVFoundation

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    init() {
        playSound("tavernSong") // Play automatically on launch
    }

    func playSound(_ soundName: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1 // 🔄 Loop the song indefinitely
                audioPlayer?.volume = 1.0 // 🔊 Full volume
                audioPlayer?.play()
            } catch {
                print("Error loading sound: \(error)")
            }
        }
    }
}
