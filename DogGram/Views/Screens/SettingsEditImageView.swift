//
//  SettingsEditImageView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 8.02.2024.
//

import SwiftUI

struct SettingsEditImageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var selectedImage: UIImage? = nil
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var isUpload: Bool = false

    var body: some View {
        VStack(spacing:5){
            HStack{
                Text("Edit Profile Picture")
                    .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                    .foregroundStyle(.purp)
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .onTapGesture {
                        dismiss()
                    }
            
            }
            .padding(.all, 10)
            
            HStack{
                Text("Description: Your profile picture will be shown on your profile and on your posts. Most users make it an image of themselves or their dog!")
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .foregroundStyle(.purp)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            
        
            Image("dog1")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(height: 230)
                .frame(maxWidth: 350)
                
            Spacer()
            Menu {
                Button{
                    sourceType = .photoLibrary
                    isUpload.toggle()
                } label:{
                    Label(
                        title: { Text("Photo Library") },
                        icon: { Image(systemName: "photo")}
                    )
                }
                Button{
                    sourceType = .camera
                    isUpload.toggle()
                } label:{
                    Label(
                        title: { Text("Take Photo") },
                        icon: { Image(systemName: "camera") }
                    )
                }
                
            } label:{
                Text("Upload Photo")
                    .font(.system(.title2, design: .rounded, weight: .medium))
                    .foregroundStyle(.purp)
                    .frame(height: 40)
                    .frame(maxWidth: screen.width)
                    .background(.yell)
                    .clipShape(.rect(cornerRadius: 15))
            }
            .padding(.all, 10)
            
            Button{
                dismiss()
            } label:{
                Text("Save")
                    .font(.system(.title2, design: .rounded, weight: .medium))
                    .foregroundStyle(.yell)
                    .frame(height: 40)
                    .frame(maxWidth: screen.width)
                    .background(.purp)
                    .clipShape(.rect(cornerRadius: 15))
            }
            .padding(.all, 10)
        }
        .fullScreenCover(isPresented: $isUpload){
            ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
        }
    }
}

#Preview {
    SettingsEditImageView()
}
