//
//  PostImageView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 7.02.2024.
//

import SwiftUI

struct PostImageView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var captionText: String = ""
    @Binding var image: UIImage?
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Button{
                    dismiss()
                } label:{
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Spacer()
                Text("  Post".uppercased())
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .foregroundStyle(.purp)
                Spacer()
                Button{
                    
                } label:{
                    Text("Edit".uppercased())
                        .font(.system(.subheadline, design: .rounded, weight: .semibold))
                }
            }
            .padding(.horizontal, 10)
            Spacer()
            ScrollView{
                Divider()
                Image(uiImage: image!)
                    .resizable().scaledToFit()
                    .frame(maxWidth: 370, maxHeight: 370)
                Divider()
                TextField("Add caption here ...", text: $captionText).padding()
                    .frame(height: 50)
                    .frame(maxWidth: screen.width - 20)
                    .foregroundStyle(.purp)
                    .background(.beige)
                    .clipShape(.rect(cornerRadius: 15))
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled()
                    .padding()
            }
            Button{
                postPicture()
            } label:{
                Text("Post")
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .frame(height: 50)
                    .frame(maxWidth: screen.width - 20)
                    .foregroundStyle(.yell)
                    .background(.purp)
                    .clipShape(.rect(cornerRadius: 15))
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled()
                    
            }
        }
        .tint(.purp)
    }
    // MARK: - FUNCTIONS
    func postPicture(){
        
    }
}

#Preview {
    PostImageView(image: .constant(UIImage(named: "logo")!))
}
