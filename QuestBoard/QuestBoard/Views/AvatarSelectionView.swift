//
//  AvatarSelectionView.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 12/03/25.
//

import SwiftUI

struct AvatarSelectionView: View {
    @Environment(\.dismiss) var dismiss
    
    var myData = sharedData
    
    @State var avatars: [String]
    
    @State var accessories: [String]
    
    @State var pets: [String]
    
    let columns = [
        GridItem(.flexible(), spacing: -50),
        GridItem(.flexible(), spacing: -50),
        GridItem(.flexible(), spacing: -50)
    ]
    
    // State to track the selected avatar/accessory/pet
    @Binding var selectedAvatar: String
    @Binding var selectedAccessory: String
    @Binding var selectedPet: String
    
    var body: some View {
        
        
        ZStack {
            
            /*
            ForEach(myData.items) { item in
                
                if(item.iconImage == "pawprint") {
                    pets.append(item.accessoryName)
                }
                
            }
            */
            // Background image
            Image("backdrop")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                ZStack {
                    Image("paper")
                        .resizable()
                        .frame(width: 375, height: 400)
                        .padding(.top, 40)
                        .padding(.bottom, -40)
                    VStack {
                        // Wooden board for the title
                        Image("woodBoard")
                            .resizable()
                            .frame(width: 270, height: 120)
                            .overlay(
                                Text("Avatar").myFont(size: 29)
                            )
                        Spacer()
                        VStack {
                            LazyVGrid(columns: columns, spacing: 40) {
                                ForEach(avatars, id: \.self) { avatar in
                                    let i: Item = getItemByName(myData: myData, name: avatar)
                                    
                                    ZStack {
                                        ForEach(i.itemImage, id: \.self) { image in
                                            
                                            Image(image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                    //select the item
                                                        .stroke(selectedAvatar == avatar ? Color.red : Color.clear, lineWidth: 4)
                                                )
                                            
                                        }
                                    }.onTapGesture {
                                            selectedAvatar = avatar
                                            
                                        }
                                }
                            }
                            Spacer()
                                .padding()
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                ZStack {
                    Image("paper")
                        .resizable()
                        .frame(width: 375, height: 400)
                        .padding(.top, 40)
                        .padding(.bottom, -25)
                    VStack {
                        // Wooden board for the title
                        Image("woodBoard")
                            .resizable()
                            .frame(width: 270, height: 120)
                            .overlay(
                                Text("Accessories").myFont(size: 29)
                            )
                        Spacer()
                        VStack{
                            LazyVGrid(columns: columns, spacing: 40) {
                                ForEach(accessories, id: \.self) { accessory in
                                    let i: Item = getItemByName(myData: myData, name: accessory)
                                    
                                    ZStack {
                                        ForEach(i.itemImage, id: \.self) { image in
                                            
                                            Image(image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                    //select the item
                                                        .stroke(selectedAccessory == accessory ? Color.red : Color.clear, lineWidth: 4)
                                                )
                                            
                                        }
                                    }.onTapGesture {
                                            selectedAccessory = accessory
                                            
                                        }
                                }
                            }
                            Spacer()
                                .padding()
                        }
                    }
                }
                ZStack {
                    Image("paper")
                        .resizable()
                        .frame(width: 375, height: 400)
                        .padding(.top, 40)
                    VStack {
                        // Wooden board for the title
                        Image("woodBoard")
                            .resizable()
                            .frame(width: 270, height: 120)
                            .overlay(
                                Text("Pet").myFont(size: 29)
                            )
                        Spacer()
                        VStack {
                            LazyVGrid(columns: columns, spacing: 40) {
                                ForEach(pets, id: \.self) { pet in
                                    let i: Item = getItemByName(myData: myData, name: pet)
                                    
                                    ZStack {
                                        ForEach(i.itemImage, id: \.self) { image in
                                            
                                            Image(image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(
                                                    Circle()
                                                    //select the item
                                                        .stroke(selectedPet == pet ? Color.red : Color.clear, lineWidth: 4)
                                                )
                                            
                                        }
                                    }
                                        .onTapGesture {
                                            selectedPet = pet
                                            
                                        }
                                }
                            }
                            Spacer()
                                .padding()
                        }
                    }
                }
            }
            Button(action: {
                dismiss()
            }){
                Image(systemName: "x.circle")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.customBrown).myShadow(weight: 10, color: .black, radius: 2)
                
            }
            .padding(.leading, 315)
            .padding(.top, -370)
        }
    }
}



#Preview {
}
