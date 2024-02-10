//
//  CommentModel.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable{
    
    var id = UUID()
    var commentID: String
    var userID: String
    var username: String
    var content: String
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
