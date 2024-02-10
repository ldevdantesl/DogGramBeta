//
//  MessageView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import SwiftUI

struct MessageView: View {
    
    @State var comment: CommentModel
    
    var body: some View {
        HStack{
            Image("dog1")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                
            VStack(alignment:.leading, spacing:4){
                Text(comment.username)
                    .font(.system(.caption, design: .rounded, weight: .semibold))
                    .foregroundStyle(.gray)
                
                Text(comment.content)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .overlay {
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading: 15, bottomTrailing: 15, topTrailing: 10)).fill(Color.gray.opacity(0.2))
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageView(comment: CommentModel(commentID: "", userID: "", username: "", content: "", dateCreated: .now))
}
