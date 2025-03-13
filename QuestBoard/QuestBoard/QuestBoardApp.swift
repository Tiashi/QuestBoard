//  QuestBoardApp.swift
//  QuestBoard
//
//  Created by Mattia on 05/03/25.
//

import SwiftUI

@main
struct QuestBoardApp: App {
    
    @StateObject private var audioManager = AudioManager()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
