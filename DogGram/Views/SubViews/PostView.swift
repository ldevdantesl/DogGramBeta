//
//  PostView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import SwiftUI

struct PostView: View {
    
    enum ActionSheetOption{
        case general
        case report
    }
    @State var postImage: UIImage = UIImage(named: "dog1")!
    
    @State var post: PostModel
    @State var sheet: Bool = false
    @State private var detent: PresentationDetent = .medium
    @State var likeAnimation: Bool = false
    @State var addHeartAnimationView: Bool
    @State var showActionSheet: Bool = false
    @State var actionOption: ActionSheetOption = .general
    
    var showHeaderFooterView: Bool
    var body: some View {
        NavigationStack{
            VStack(spacing:0){
                if showHeaderFooterView{
                    // MARK: - HEADER
                    HStack{
                        NavigationLink{
                            ProfileView(profileDisplayName: post.username, profileUserID: post.userID, isMyProfile: false)
                        } label:{
                            Image(uiImage: postImage)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 40, height: 40)
                                
                            Text(post.username)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundStyle(.primary)
                        }
                        Spacer()
                        Button{
                            showActionSheet.toggle()
                        } label:{
                            Image(systemName: "ellipsis")
                        }
                        .confirmationDialog("What would you like to do ?", isPresented: $showActionSheet) {
                            getActionSheet()
                        }
                    }
                    .padding(.all, 5)
                }
                
                
                // MARK: - IMAGE
                
                ZStack{
                    Image("dog7")
                        .resizable()
                        .scaledToFit()
                        .onTapGesture(count: 2){
                            if post.likedByUser{
                                unlikePost()
                            } else{
                                likePost()
                            }
                        }
                    if addHeartAnimationView{
                        LikeAnimationView(animate: $likeAnimation)
                    }
                }
               
                
                if showHeaderFooterView{
                    // MARK: - FOOTER
                    HStack(spacing:20){
                        Button{
                            if post.likedByUser{
                                unlikePost()
                            } else{
                                likePost()
                            }
                        } label:{
                            Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(post.likedByUser ? .red : .primary)
                                .fontWeight(.regular)
                                .scaleEffect(likeAnimation ? 1.2 : 1.0)
                                
                        }
                        
                        // MARK: - COMMENTS
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .fontWeight(.medium)
                            .onTapGesture {
                                sheet.toggle()
                            }
                        
                        Image(systemName: "paperplane")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .fontWeight(.medium)
                            .onTapGesture {
                                sharePost()
                            }
                        Spacer()
                    }
                    .padding(.all,10)
                    HStack{
                        Text("\(post.likeCount) likes")
                            .font(.system(.headline, design: .rounded, weight: .semibold))
                        Spacer(minLength: 0)
                    }
                    .padding(.all,10)
                    if let caption = post.caption{
                        HStack{
                            Text(caption)
                            Spacer(minLength: 0)
                        }
                        .padding(.all,10)
                    }
                }
                Divider()
            }
            .tint(.primary)
            .sheet(isPresented: $sheet, onDismiss: {
                detent = .medium
            }){
                CommentsView(detent: $detent)
                    .presentationDetents([detent])
                    .presentationDragIndicator(.visible)
                    .animation(.easeInOut, value: 2)
            }
            
        }
        
    }
    func likePost(){
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount + 1, likedByUser: true)
        withAnimation(.easeInOut(duration: 0.2)) {
            self.post = updatedPost
            likeAnimation = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                likeAnimation = false
            }
        }
        
        
    }
    
    func unlikePost(){
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount - 1, likedByUser: false)
        withAnimation(.easeInOut(duration: 0.2)) {
            self.post = updatedPost
        }
    }
    
    @ViewBuilder
    func getActionSheet() -> some View{
        switch self.actionOption {
        case .general:
            Button(role:.destructive){
                actionOption = .report
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                    self.showActionSheet.toggle()
                }
            } label:{
                Text("Report")
                    .foregroundStyle(.red)
            }
            Button{
            } label:{
                Text("Learn More...")
            }
        case .report:
            Button(role:.destructive){
                
            } label:{
                Text("This is inappropriate")
            }
            Button(role:.destructive){
                
            } label:{
                Text("This is spam")
            }
            Button(role:.destructive){
                
            } label:{
                Text("This made me uncomfortable")
            }
        }
        
    }
    
    func sharePost(){
        
        let message = "Hey! Check this post in DogGram!"
        let image = self.postImage
        let link = URL(string: "https://www.google.com")!
        let activityViewController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: [])
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true)
    }
}

#Preview {
    PostView(post: PostModel.samplePost, addHeartAnimationView: true, showHeaderFooterView: true)
}
