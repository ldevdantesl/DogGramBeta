//
//  PostModel.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable{
    var id = UUID()
    var postID: String //Id for the post in database
    var userID: String
    var username: String
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PostModel{
    static var samplePost: PostModel{
        return PostModel(postID: "", userID: "", username: "John Cena", caption: "This is test caption",dateCreated: .now, likeCount: 12, likedByUser: false)
    }
}

