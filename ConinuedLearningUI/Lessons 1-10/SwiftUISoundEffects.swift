// Lesson 9
//
//  SwiftUISoundEffects.swift
//  ConinuedLearningUI
//
//  Created by Tirzaan on 7/24/25.
//

import SwiftUI
import AVKit

/// Manager for all Sound Playing
class SoundManager {
    static let instance = SoundManager() // Singleton
    
    var player: AVAudioPlayer?
    
    enum soundOption: String {
        case tada
        case badumtss
    }
    
    /// Plays a selected sound from the soundOptions enum
    func playSound(sound: soundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
        
    }
}

/// Shows Buttons that play sounds using the SoundManager
struct SwiftUISoundEffects: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            
            Button("Play Sound 2") {
                SoundManager.instance.playSound(sound: .badumtss)
            }
        }
    }
}

#Preview {
    SwiftUISoundEffects()
}
