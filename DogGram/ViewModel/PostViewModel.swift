//
//  PostViewModel.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import Foundation

class PostViewModel: ObservableObject{
    
    @Published var posts: [PostModel] = []
    
    init(){
        let post1 = PostModel(postID: "", userID: "", username: "Dantes", caption: "What the hell broo.", dateCreated: .now, likeCount: 12, likedByUser: false)
        
        let post2 = PostModel(postID: "", userID: "", username: "Justin", dateCreated: .now, likeCount: 8, likedByUser: false)
        
        let post3 = PostModel(postID: "", userID: "", username: "Flamie",caption: "Look at that. I hoped that it is lorem impsum. Lorem Impsum lorem ipsum, lorem lorem ipsum lorem impsum.", dateCreated: .now, likeCount: 9000, likedByUser: false)
        
        let post4 = PostModel(postID: "", userID: "", username: "John", caption: "IDGAF🫣", dateCreated: .now, likeCount: 12, likedByUser: false)
        
        self.posts.append(post1)
        self.posts.append(post2)
        self.posts.append(post3)
        self.posts.append(post4)
    }
    
    init(post: PostModel){
        self.posts.append(post)
    }
}
