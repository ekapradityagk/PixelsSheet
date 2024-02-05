//
//  PlayerListView.swift
//  PixelsSheet
//
//  Created by Eka Praditya on 29/01/24.
//

import SwiftUI

//struct PlayerListView: View {
//    
//    @State var isDetailed = false
//    
//    var body: some View {
//        NavigationStack{
//            NavigationLink(destination: PlayerDetailView()) {
//                ListPlayerView()
//            }
//        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .frame(maxWidth: isDetailed ? .infinity : UIScreen.main.bounds.width - 20, maxHeight: isDetailed ? .infinity : 180)
//    }
//}

struct PlayerListView: View {
    
    var playerName: String = "Shyduck"
    var playerLvSkill: Int = 1
    var playerBerry: Float = 0.0
    var playerBerryInItem: Float = 0.0
    var playerReputation: Int = 0
    var isVIP = true
    
    @State private var isDetailed = false
    @State private var isPresented = false
    
    var body: some View{
        
//        VStack{
            
            VStack(alignment:.leading){
                HStack{
                    Text(playerName)// player
                        .font(.largeTitle).bold()
                    
                    Text("lv \(playerLvSkill)").padding(.top, 11)
                    Spacer()
                    
                    if isVIP{
                        Image(systemName: "crown.fill").foregroundColor(.pink)
                    }
                }
                
                Color.black.frame(maxWidth: .infinity, maxHeight: 1)
                
                Text("Berry : \(playerBerry.formatted())")
                    .padding(.top, 5)
                
                Text("Berry in item : \(playerBerryInItem.formatted())")
                
                Text("Reputation : \(playerReputation)")
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            //        .frame(maxWidth: isDetailed ? .infinity : UIScreen.main.bounds.width - 20, maxHeight: isDetailed ? .infinity : 180)
            
            
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.blue)
        
        
    }
}
#Preview {
    PlayerListView()
}
