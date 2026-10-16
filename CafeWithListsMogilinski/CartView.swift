//
//  CartView.swift
//  CafeWithListsMogilinski
//
//  Created by AARON MOGILINSKI on 10/7/26.
//

import SwiftUI

struct CartView: View {
    
    
    @Binding var cart: [Item]
    
    var total: Double {
            cart.reduce(0.0) { $0 + ($1.price * Double($1.count)) }
        }
    
    var body: some View {
        
        
        ZStack{
            
            Color.gray
                .ignoresSafeArea()
            
            VStack{
                
                Text("Your Cart")
                    .font(.largeTitle.bold())
                
            List{
                
                ForEach(cart, id: \.self) { car in
                     let quantity = car.count
                        
                        //                    total += (item.price * Double(quantity))
                        
                        Text("\(car.name), Quantity: \(quantity), Total Price: \((car.price * Double(quantity)).formatted(.currency(code: "USD")))")
                            .listRowBackground(Color.brown)
                            
                        
                    
                    
                }
                
//                ForEach(Array(cart.keys), id: \.self) { item in
//
//                    
//                }
                
                
            }
            .scrollContentBackground(.hidden)
            
            Text("Total: \((total).formatted(.currency(code: "USD")))")
            
        }
            .background(.gray)
            
            
        
    }
        
        
        
    }
}

#Preview {
    CartView(cart: .constant([]))
}
