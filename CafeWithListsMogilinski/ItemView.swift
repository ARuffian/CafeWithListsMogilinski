//
//  ItemView.swift
//  CafeWithListsMogilinski
//
//  Created by AARON MOGILINSKI on 10/6/26.
//

import SwiftUI

struct ItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var item: Item
    
    @State var count: Int = 0
    
    @State var steppie: Int = 0
    
     @Binding var cart: [Item: Int]
    
    @Binding var county: Int
    
    var body: some View {
        
        
        
        NavigationStack{
            
            ZStack {
                
                Color.brown
                    .ignoresSafeArea()
                VStack {
                
                Text(item.name)
                    .font(.title)
                Text(item.price.formatted(.currency(code: "USD")))
                Text("Calories: \(item.calories)")
                
                Image(item.image)
                    .resizable()
                // .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 45))
                
                    .scaledToFit()
                
                HStack{
                    Text("Quantity: \(steppie)")
                        .padding(.leading, 100)
                    Stepper("", value: $steppie, in: 0...100000)
                        .padding(.trailing, 110)
                }
                
                
                Button("Add To Cart"){
                    county += steppie
                    cart[item, default: 0] += steppie
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
                .padding()
                .background(.brown)
        }
            
        }
        .background(.gray)
        
        
        
    }
        
}

#Preview {
    ItemView(
        item: Item(name: "Sample", price: 2.99, calories: 100, image: "potato"),
        cart: .constant([:]),
        county: .constant(0)
    )
}
