//
//  Item.swift
//  CafeWithListsMogilinski
//
//  Created by AARON MOGILINSKI on 10/5/26.
//

//import SwiftUI
//
//
//@Observable
//class Item {
//    
//    var uid = UUID()
//    
//    var name: String
//    
//    var price: Double
//    
//    var calories: Int
//    
//    var image: String
//    
//    
//    init(name: String, price: Double, calories: Int, image: String){
//        self.name = name
//        self.price = price
//        self.calories = calories
//        self.image = image
//        
//    }
//    
//    
//}
struct Item: Hashable {
 
    var name: String
    var price: Double
    var calories: Int
    var image: String
}
