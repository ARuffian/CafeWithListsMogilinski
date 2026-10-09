//
//  CartView.swift
//  CafeWithListsMogilinski
//
//  Created by AARON MOGILINSKI on 10/7/26.
//

import SwiftUI

struct CartView: View {
    
    
    @Binding var cart: [Item: Int]
    
    @State var total: Double = 0.0
    
    var body: some View {
        
        
        ZStack{
            
            Color.gray
                .ignoresSafeArea()
            
            VStack{
                
                Text("Your Cart")
                    .font(.largeTitle.bold())
                
            List{
                ForEach(Array(cart.keys), id: \.self) { item in
                    if let quantity = cart[item], quantity > 0 {
                        
                        //                    total += (item.price * Double(quantity))
                        
                        Text("\(item.name), Quantity: \(quantity), Total Price: \((item.price * Double(quantity)).formatted(.currency(code: "USD")))")
                            .listRowBackground(Color.brown)
                            .onAppear(){
                                total += (item.price * Double(quantity))
                            }
                        
                    }
                    
                }
                
                
            }
            .scrollContentBackground(.hidden)
            
            Text("Total: \((total).formatted(.currency(code: "USD")))")
            
        }
            .background(.gray)
            
            
        
    }
        
        
        
    }
}

#Preview {
    CartView(cart: .constant([:]))
}
