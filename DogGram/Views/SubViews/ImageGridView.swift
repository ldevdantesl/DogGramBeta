//
//  ImageGridView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import SwiftUI

struct ImageGridView: View {
    @ObservedObject var postVM = PostViewModel()
    var body: some View {
        NavigationStack{
            LazyVGrid(
                columns: [GridItem(.flexible()),
                          GridItem(.flexible()),
                          GridItem(.flexible())],
                alignment: .center,
                spacing: 7,
                pinnedViews: [],
                content: {
                    ForEach(postVM.posts, id:\.self) { post in
                        NavigationLink{
                            FeedView(postsVM: PostViewModel(post: post))
                        } label: {
                            PostView(post: post, addHeartAnimationView: false, showHeaderFooterView: false)
                        }
                    }
            })
        }
    }
}

#Preview {
    ImageGridView()
}
