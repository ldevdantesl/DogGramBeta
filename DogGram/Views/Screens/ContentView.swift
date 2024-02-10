//
//  ContentView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 5.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    var userId: String? = "nil"
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack{
            if let _ = userId {
                TabView {
                    FeedView()
                        .tabItem { Label("Feed", systemImage: "book.fill") }
                    
                    BrowseView()
                        .tabItem { Label("Browse", systemImage: "magnifyingglass")}
                    
                    ProfileView(profileDisplayName:"My Profile",profileUserID: "", isMyProfile: true)
                        .tabItem { Label("Account", systemImage: "person.fill")}
                }
                .tint(colorScheme == .dark ? .yell : .purp)
            }
            else {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
