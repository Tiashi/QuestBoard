//  ProfileView.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct ProfileView: View {
    // User data
    @State private var playerName: String = "NAME"
    @State private var rotation: Double = 0
    
    var myData = sharedData
    
    
    @State private var selectedAvatar: String = "avatar"
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Image("backdrop")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                // Scrollable view
                ScrollView {
                    
                    VStack {
                        // Avatar
                        Image(selectedAvatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        
                        // Editable Name
                        TextField("Enter Name", text: $playerName)
                            .font(.custom("Mirage Gothic", size: 40))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: 200).minimumScaleFactor(0.5).lineLimit(1)
                        
                        // Level & Gold
                        HStack {
                            Text("LVL. \(myData.level)")
                                .myFont(size: 18)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(myData.gold)")
                                    .myFont(size: 18)
                                    .foregroundColor(.black)
                                Image(systemName: "dollarsign.circle.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                        .frame(width: 250).padding(.vertical, 7)
                        
                        // EXP Bar with Proper Text Alignment & Flexibility
                        VStack(alignment: .leading, spacing: 5) {
                            // EXP label and value in one line
                            HStack {
                                Text("EXP")
                                    .myFont(size: 18)
                                    .foregroundColor(.black)
                                    .bold()
                                
                                Spacer()
                                
                                Text("\(myData.exp)/\(myData.expToNextLvl)")
                                    .myFont(size: 18)
                                    .foregroundColor(.black)
                                    .bold()
                            }
                            
                            // Progress bar with flexible width
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(height: 20)
                                        .foregroundColor(.gray.opacity(0.3))
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: CGFloat((Double(myData.exp) / Double(myData.expToNextLvl)) * geometry.size.width), height: 20)
                                        .foregroundColor(.blue)
                                }
                            }
                            .frame(height: 20) // Ensures GeometryReader doesn't expand indefinitely
                        }
                        .padding(.horizontal, 50)
                        
                        VStack {
                            Image("potion" + "\(myData.questsCompletedToday)")
                                .resizable().rotationEffect(.degrees(rotation)).onAppear {
                                    shake()
                                }
                                .frame(width: 230, height: 230)
                                
                            
                            Text("\(myData.questsCompletedToday)/5")
                                .myFont(size: 35)
                                .foregroundColor(.black)
                                .bold()
                                .padding(.top, -40)
                            
                        }
                        
                        
                        // Stats Section
                        ZStack {
                            Image("paper")
                                .resizable()
                                .frame(width: 370, height: 290)
                                .padding(.top, 30)
                            VStack {
                                Image("woodBoard")
                                    .resizable()
                                    .frame(width: 150, height: 70)
                                    .overlay(Text("Stats").myFont(size: 25).foregroundColor(.black))
                                Spacer ()
                                VStack(alignment: .leading, spacing: 6) {
                                    StatRow(stat: "Attack", value: 10)
                                    StatRow(stat: "Defense", value: 10)
                                    StatRow(stat: "Speed", value: 10)
                                    StatRow(stat: "Energy", value: 10)
                                    StatRow(stat: "Focus", value: 10)
                                    StatRow(stat: "Willpower", value: 10)
                                    StatRow(stat: "Creativity", value: 10)
                                    
                                }.padding(.bottom, 10)
                                Spacer ()
                            }
                            .frame(width: 250)
                            .cornerRadius(10)
                        }
                        
                        Spacer()
                        
                    }
                }
            }
        }
    }
    
    // Stats Row Component
    struct StatRow: View {
        let stat: String
        let value: Int
        
        var body: some View {
            HStack {
                Text("\(stat):")
                    .myFont(size: 20)
                    .foregroundColor(.black)
                Spacer()
                Text("\(value)")
                    .myFont(size: 24)
                    .foregroundColor(.black)
            }
        }
    }
    func shake() {
            Task {
                
                let clampedQuestCompleted = max(0, min(myData.questsCompletedToday, 5))
                
                if myData.questsCompletedToday != 0 {
                    while true {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            rotation = -5 * Double(clampedQuestCompleted)
                        }
                        try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 seconds
                        withAnimation(.easeInOut(duration: 0.1)) {
                            rotation = 5 * Double(clampedQuestCompleted)
                        }
                        withAnimation(.easeInOut(duration: 0.1)) {
                            rotation = 0 // Reset after shaking
                        }
                        
                        let sleepTime: UInt64 = 2_000_000_000 / UInt64(clampedQuestCompleted)
                        
                        try? await Task.sleep(nanoseconds: sleepTime)
                    }
                }
            }
        }
   
    
    
}

#Preview {
    ContentView()
}
