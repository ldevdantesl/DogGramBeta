//
//  ProfileHeaderView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 7.02.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var profileDisplayName: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack{
            // MARK: - PROFILE PICTURE
            Image("dog1")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(height: 120)
                .frame(maxWidth: 180)
                
            
            // MARK: - USERNAME
            Text(profileDisplayName)
                .font(.system(.title, design: .rounded, weight: .bold))
                .foregroundStyle(.tint)
            
            // MARK: - BIO
            Text("There is should be bio of the user")
                .font(.system(.body, design: .rounded, weight: .semibold))
            
            // MARK: - POSTS AND LIKES
            HStack(spacing:20){
                
                // MARK: - POSTS
                VStack(spacing:5){
                    Text("5")
                        .font(.system(.title2, design: .rounded, weight: .bold))
                    
                    Capsule()
                        .fill(colorScheme == .dark ? .yell : .purp)
                        .frame(width: 40, height: 5)
                    
                    Text("Posts")
                        .font(.system(.callout, design: .rounded, weight: .medium))
                        
                }
                Spacer()
                    .frame(width: 100)
                // MARK: - LIKES
                VStack(spacing:5){
                    Text("20")
                        .font(.system(.title2, design: .rounded, weight: .bold))
                    
                    Capsule()
                        .fill(colorScheme == .dark ? .yell : .purp)
                        .frame(width: 40, height: 5)
                    
                    Text("Likes")
                        .font(.system(.callout, design: .rounded, weight: .medium))
                }
            }
            .padding(.vertical,10)
        }
        .tint(.primary)
        .padding(.horizontal,10)
    }
}

#Preview {
    ProfileHeaderView(profileDisplayName: .constant(""))
}
