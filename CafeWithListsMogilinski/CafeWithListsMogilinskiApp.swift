//
//  CafeWithListsMogilinskiApp.swift
//  CafeWithListsMogilinski
//
//  Created by AARON MOGILINSKI on 10/1/26.
//

import SwiftUI
import SwiftData

@main
struct CafeWithListsMogilinskiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
        
    }
}
