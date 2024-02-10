//
//  ProfileView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 7.02.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var postVM = PostViewModel()

    @Environment(\.colorScheme) var colorScheme
    
    @State var profileDisplayName: String
    @State var isSettingsCover: Bool = false
    @State var isImageSheet: Bool = false
    @State var isSelectedImageCover: Bool = false
    @State var selectedImage: UIImage? = nil
    @State var imageSourceType: UIImagePickerController.SourceType = .camera
    
    var profileUserID: String
    var isMyProfile: Bool
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                // MARK: - PROFILE HEADER
                HStack{
                    Text("Profile")
                        .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                        .foregroundStyle(colorScheme == .dark ? .yell : .purp)
                    Spacer()
                    
                    if isMyProfile{
                        Menu {
                            Button{
                                imageSourceType = .camera
                                isImageSheet.toggle()
                            } label:{
                                Label(
                                    title: { Text("Take Photo") },
                                    icon: { Image(systemName: "camera") }
                                )
                            }
                            Button{
                                imageSourceType = .photoLibrary
                                isImageSheet.toggle()
                            } label:{
                                Label(
                                    title: { Text("Upload Image") },
                                    icon: { Image(systemName: "folder") }
                                )
                                
                            }
                            Button{
                                imageSourceType = .photoLibrary
                                isImageSheet.toggle()
                            } label:{
                                Label(
                                    title: { Text("Photo Library") },
                                    icon: { Image(systemName: "photo") }
                                )
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(colorScheme == .dark ? .brown : .purp)
                                .symbolEffect(.pulse, options: .repeat(2))
                        }
                        .padding(.trailing, 10)
                        Button{
                            isSettingsCover.toggle()
                        } label:{
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(colorScheme == .dark ? .yell : .purp)
                        }
                    }
                }
                .padding(.horizontal)
                .sheet(isPresented: $isImageSheet){
                    if let _ = selectedImage {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            isSelectedImageCover.toggle()
                        }
                    }
                } content: {
                    ImagePicker(imageSelected: $selectedImage, sourceType: $imageSourceType)
                }
                
                // MARK: - PROFILE VIEW
                ProfileHeaderView(profileDisplayName: $profileDisplayName)
                Divider()
                ImageGridView(postVM: postVM)
            }
            .fullScreenCover(isPresented: $isSelectedImageCover){
                PostImageView(image: $selectedImage)
            }
            .fullScreenCover(isPresented: $isSettingsCover){
                SettingsView()
            }
        }
    }
}

#Preview {
    ProfileView(profileDisplayName: "",profileUserID: "", isMyProfile: true)
}
