//
//  CommentsView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import SwiftUI

struct CommentsView: View {
    
    @State private var submissionText: String = ""
    @State var comments: [CommentModel] = []
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @Binding var detent: PresentationDetent
    
    var body: some View {
        VStack {
            HStack{
                Text("Comments:")
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .foregroundStyle(colorScheme == .dark ? .yell : .purp)
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(colorScheme == .dark ? .yell : .purp)
                    .onTapGesture {
                        detent = .medium
                        dismiss()
                    }
            }
            .padding(.top, 20)
            ScrollView{
                LazyVStack{
                    ForEach(comments, id: \.self){ comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack{
                
                Image("dog1")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                
                TextField("Add a comment here...", text: $submissionText)
                    .foregroundStyle(colorScheme == .dark ? .yell : .purp)
                    .autocorrectionDisabled()
                    .keyboardType(.default)
                    .onTapGesture {
                        withAnimation {
                            detent = .large
                        }
                    }
                
                Button{
                    
                } label:{
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(colorScheme == .dark ? .yell : .purp)
                }
            }
            
        }
        .padding(.horizontal, 10)
        .tint(Color.MyTheme.purpleColor)
        .onAppear{
            getComments()
        }
        
    }
    
    func getComments(){
        comments = [CommentModel(commentID: "", userID: "", username: "John", content: "Hello brother", dateCreated: .now)]
    }
}

#Preview {
    CommentsView(detent: .constant(.medium))
}
