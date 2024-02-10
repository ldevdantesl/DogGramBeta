//
//  FeedView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var postsVM = PostViewModel()
    
    var body: some View {
        ScrollView {
            HStack{
                Text("DogGram")
                    .font(.system(.title3, design: .rounded, weight: .bold))
                    .foregroundStyle(Color.MyTheme.yellowColor)
                Spacer()
            }
            .padding(.horizontal, 10)
            LazyVStack{
                ForEach(postsVM.posts, id:\.self){ post in
                    PostView(post: post, addHeartAnimationView: true, showHeaderFooterView: true)
                }
            }
            
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    FeedView()
}
