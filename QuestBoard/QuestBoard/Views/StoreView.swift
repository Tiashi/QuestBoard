//  StoreView.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct StoreView: View {
    
        var myData = sharedData
        var statsName = ["Attack", "Defense", "Speed", "Energy", "Focus", "Willpower", "Creativity"]
        
        var body: some View {
            ZStack() {
                Image("background").resizable().frame(width: 460, height: 793)
                
                Text(" Store").font(.title).padding(.bottom, 630)
                
                ScrollView() {
                    ForEach(myData.items.indices, id: \.self) { index in
                        
                        let item = myData.items[index]
                        if !item.sold {
                            ZStack() {
                                Image("woodBoard")
                                    .resizable()
                                    .aspectRatio(
                                        contentMode: .fit
                                    ).frame(
                                        width: 350
                                    ).padding(.vertical, -15)
                                
                                VStack() {
                                    HStack() {
                                        Text(item.accessoryName).myFont(size: 20)
                                        
                                        Image(systemName: item.iconImage)
                                    }   //end HStack
                                    .padding(.top, -10)
                                    
                                    HStack() {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [Color.white, Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top
                                                    )
                                                )
                                                .frame(width: 70, height: 70)
                                            
                                            ForEach(item.itemImage, id: \.self) { image in
                                                
                                                Image(image).resizable().frame(width: 70, height: 70).padding(.bottom, 10)
                                                
                                            }
                                            
                                            Circle()
                                                .stroke(Color.black, lineWidth: 2).frame(width: 70, height: 70)
                                        }
                                        
                                        VStack() {
                                            ForEach(item.stats.indices, id: \.self) {
                                                index in
                                                if item.stats[index] != 0 {
                                                    Text("+" + "\(item.stats[index])" + " " + statsName[index]).myFont(size: 15)
                                                }   //end if
                                            }   //end ForEach
                                        }   //end VStack
                                        ZStack() {
                                            
                                            Button {
                
                                                if(item.cost <= myData.gold) {
                                                    myData.items[index].sold = true
                                                    myData.gold -= item.cost
                                                }
                                                
                                            } label: {
                                                RoundedRectangle(cornerRadius: 5).frame(width: 65, height: 50).foregroundStyle(.green).overlay(Text("\(item.cost)").myFont(size: 20)).foregroundColor(.black)
                                            }   //end Button
                                            
                                        }
                                    }   //end HStack
                                    .padding(.top, -10)
                                }   //end VStack
                            }   //end ZStack
                        }
                    }   //end ForEach
                    ForEach(myData.items.indices, id: \.self) { index in
                        
                        let item = myData.items[index]
                        if item.sold {
                            ZStack() {
                                Image("woodBoard")
                                    .resizable()
                                    .aspectRatio(
                                        contentMode: .fit
                                    ).frame(
                                        width: 350
                                    ).padding(.vertical, -15)
                                
                                VStack() {
                                    HStack() {
                                        Text(item.accessoryName).myFont(size: 20)
                                        
                                        Image(systemName: item.iconImage)
                                    }   //end HStack
                                    .padding(.top, -10)
                                    
                                    HStack() {
                                        
                                        ZStack {
                                            
                                            Circle()
                                                .fill(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [Color.white, Color.clear]),
                                                        startPoint: .bottom,
                                                        endPoint: .top
                                                    )
                                                )
                                                .frame(width: 70, height: 70)
                                            
                                            ForEach(item.itemImage, id: \.self) { image in
                                                
                                                Image(image).resizable().frame(width: 70, height: 70).padding(.bottom, 10)
                                                
                                            }
                                            
                                            Circle()
                                                .stroke(Color.black, lineWidth: 2).frame(width: 70, height: 70)
                                        }
                                        
                                        VStack() {
                                            ForEach(item.stats.indices, id: \.self) {
                                                index in
                                                if item.stats[index] != 0 {
                                                    Text("+" + "\(item.stats[index])" + " " + statsName[index]).myFont(size: 15)
                                                }   //end if
                                            }   //end ForEach
                                        }   //end VStack
                                        ZStack() {
                                            
                                            RoundedRectangle(cornerRadius: 5).frame(width: 65, height: 50).foregroundStyle(.red).overlay(Text("Owned").myFont(size: 20)).foregroundColor(.black)
                                            
                                        }
                                    }   //end HStack
                                    .padding(.top, -10)
                                }   //end VStack
                                Image("boardBlackMask")
                                    .resizable()
                                    .aspectRatio(
                                        contentMode: .fit
                                    ).frame(
                                        width: 350
                                    ).padding(.vertical, -15).opacity(0.6)
                            }   //end ZStack
                            
                        }
                    }   //end ForEach
                    .padding(.top, -15)
            }   //end ScrollView
            .frame(height: 540).padding(.top, 35)
                
            ZStack() {
                RoundedRectangle(cornerRadius: 5).frame(width: 65, height: 35).foregroundStyle(.green)
                
                Text("10000")
            }   //end ZStack of the owned coin
            .padding(.top, 690)
            }   //end ZStack
            .ignoresSafeArea(edges: .top)
        }
}

#Preview {
    ContentView()
}
