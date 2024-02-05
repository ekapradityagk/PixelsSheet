//
//  ItemListView.swift
//  PixelsSheet
//
//  Created by Eka Praditya on 30/01/24.
//

import SwiftUI

struct ItemPlayerListView: View {
    
    @FetchRequest(sortDescriptors: []) var itemBag : FetchedResults<PlayerBag>
    
    var playerName = ""
    
    var body: some View {
        VStack{
            VStack{
                ForEach (itemBag) {itemData in
                    if itemData.playerName == playerName{
                        HStack{
                            Text(itemData.itemName ?? "unknown")
                            Spacer()
                            Text("\(itemData.qty)")
                        }
                        .padding(.horizontal, 10)
                    }
                }

            }
            
            .background(.white)
            
            
            
        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        .background(.blue)
    }
}

#Preview {
    ItemPlayerListView()
}
