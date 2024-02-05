//
//  ItemDetailCreationView.swift
//  PixelsSheet
//
//  Created by Eka Praditya on 27/01/24.
//

import SwiftUI

struct ItemDetailCreationView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var itemData: FetchedResults<Item>
    @FetchRequest(sortDescriptors: []) var ingredients: FetchedResults<ItemIngriedient>

    var itemName: String = "Pancakes"
    
    var body: some View {
//        let cCuan = CalcCuanView()
        let pancakePrice = getItem("Pancakes")?.priceMP ?? 0
        let eggPrice = getItem("Egg")?.priceMP ?? 0
        let butterberryPrice = getItem("Butterberry")?.priceMP ?? 0

        VStack{

            HStack{
                Text(itemName)
                    .font(.title)
                Spacer()
            }
            HStack{
                Text("MarketPlace Price : \(pancakePrice.formatted())")
                Spacer()
            }
            HStack{
                let bbPrice = 2 * butterberryPrice
                Text("2 ButterBerry : \(bbPrice.formatted())")
                Spacer()
            }
            HStack{
                Text("1 Egg : \(eggPrice.formatted())")
                Spacer()
            }
            HStack{
                Text("Modal : \(calcPancake().formatted())")
                Spacer()
            }
            HStack{
                let cuan = calcPancake() - pancakePrice
                Text("cuan : \(cuan.formatted())")
                Spacer()
            }

        }
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
        .frame(maxWidth: UIScreen.main.bounds.width-40)
        .onAppear(){
            print("bongkar entity jadi nested dir \(getRecipeFor(itemName))")
        }
    }
        
    
    func getRecipeFor(_ targetItem: String) -> [String:[[String:Int32]]]{
        var tempArr = [[String:Int32]]()
        for item in ingredients{
            if item.targetItem == targetItem && item.name != "" && item.qty != 0{
                let itemName = item.name ?? "unknown" // to remove the optional | swift really uncertainty
                let tempDict = [itemName:item.qty]
                tempArr.append(tempDict)
            }
        }
        return [targetItem:tempArr]
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
    ItemDetailCreationView()
}
