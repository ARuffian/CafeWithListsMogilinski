//
//  ContentView.swift
//  CafeWithListsMogilinski
//
//  Created by AARON MOGILINSKI on 10/1/26.
//

import SwiftUI





struct ContentView: View {
    
    @State var itemArray: [Item] = []
    
    var item1 = Item(name: "Potato", price: 12.99, calories: 10000, image: "potato")
    
    var item2 = Item(name: "Pineapple", price: 2.99, calories: 10, image: "pineapple")
    
    var item3 = Item(name: "Pina Colada", price: 5.99, calories: 500, image: "pina_colada")
    
    var item4 = Item(name: "Primrose", price: 0.99, calories: 0, image: "primrose")
    
    var item5 = Item(name: "Brennan", price: 0.0, calories: 100000000, image: "stupidmcstupidface")
    
    @State var tf = true
    
    @State var cart: [Item: Int] = [:]
    
    @State var county = 0
    
    
    
    
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
                                itemArray.append(item1)
                                itemArray.append(item2)
                                itemArray.append(item3)
                                itemArray.append(item4)
                                itemArray.append(item5)
                                tf = false
                            }
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
