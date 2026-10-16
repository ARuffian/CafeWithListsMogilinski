//
//  ContentView.swift
//  CafeWithListsMogilinski
//
//  Created by AARON MOGILINSKI on 10/1/26.
//

import SwiftUI
import SwiftData





struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State var itemArray: [Item] = []
    
    var item1 = Item(name: "Potato", price: 12.99, calories: 10000, image: "potato", count: 0)
    
    var item2 = Item(name: "Pineapple", price: 2.99, calories: 10, image: "pineapple", count: 0)
    
    var item3 = Item(name: "Pina Colada", price: 5.99, calories: 500, image: "pina_colada", count: 0)
    
    var item4 = Item(name: "Primrose", price: 0.99, calories: 0, image: "primrose", count: 0)
    
    var item5 = Item(name: "Brennan", price: 0.0, calories: 100000000, image: "stupidmcstupidface", count: 0)
    
    @State var tf = true
    
    @State var cart: [Item] = []
    
    @State var county = 0
    
    @Query var carts: [Item]
    
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                
                Color.gray
                    .ignoresSafeArea()
                
                VStack {
                    
                    NavigationLink ("Cart: \(county)"){
                        CartView(cart: $cart)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.leading, 250)
                    
                    Text("Cafe Mini App")
                        .font(.largeTitle.bold())
                        .onAppear(){
                            if tf == true{
                                context.insert(item1)
                                context.insert(item2)
                                context.insert(item3)
                                context.insert(item4)
                                context.insert(item5)
                                itemArray.append(item1)
                                itemArray.append(item2)
                                itemArray.append(item3)
                                itemArray.append(item4)
                                itemArray.append(item5)
                                tf = false
                            }
                            try? context.save()
                        }
                    
                    
                    
                    
                    List{
                        
                        ForEach(0..<itemArray.count, id: \.self) { i in
                            
                            // Text(itemArray[i].name)
                            NavigationLink {
                                ItemView(item: itemArray[i], cart: $cart, county: $county)
                            } label: {
                                HStack {
                                    Image(itemArray[i].image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    //
                                    Label(itemArray[i].name, systemImage: itemArray[i].image)
                                    
                                }
                                
                            }
                            .listRowBackground(Color.brown)
                            
                            
                        }
                        
                        
                        
                    }
                    .listStyle(.plain)
                    .background(.brown)
                    .clipShape(RoundedRectangle(cornerRadius: 45))
                    //            .navigationTitle("Cafe Mini App")
                    
                    
                    
                    
                }
                .padding()
            }
            
            
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
