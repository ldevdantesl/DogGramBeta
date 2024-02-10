//
//  DogGramApp.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 10.02.2024.
//

import SwiftUI
import FirebaseCore

@main
struct DogGramApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
