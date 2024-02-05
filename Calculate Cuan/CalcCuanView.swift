//
//  CalcCuanView.swift
//  PixelsSheet
//
//  Created by Eka Praditya on 27/01/24.
//

import SwiftUI

struct CalcCuanView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var itemData: FetchedResults<Item>
    
    var body: some View {
        VStack{
            Button(action: {
                print("pancake price is \(calcPancake().formatted())")
            }, label: {
                Text("calc")
            })
            
            ItemDetailCreationView(itemName: "Pancakes")
            
        }
    }
    
    func calcPancake() -> Float{
        let egg = getItem("Egg")
        let butterberry = getItem("Butterberry")
        return ((2*(butterberry?.priceMP ?? 0))+(egg?.priceMP ?? 0))
    }

    func getItem(_ itemName:String) -> Item? {
        if let itemData = itemData.first(where: { $0.name == itemName }) {
            // Do something with eggData
            return itemData
        }
        return nil
    }
}

#Preview {
    CalcCuanView()
}
