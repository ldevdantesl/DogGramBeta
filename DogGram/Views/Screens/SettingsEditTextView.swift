//
//  SettingsEditTextView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 8.02.2024.
//

import SwiftUI

struct SettingsEditTextView: View {
    
    @Binding var submissionText: String
    
    @State var title: String
    @State var description: String
    @State var placeHolder: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack{
                Text("Edit \(title)")
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
                Text("Description: \(description)")
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .foregroundStyle(.purp)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            
            TextField("\(placeHolder)", text: $submissionText).padding()
                .frame(height: 40)
                .frame(maxWidth: screen.width - 20)
                .background(Color.beige)
                .clipShape(.rect(cornerRadius: 15))
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            Spacer()
            Button{
                
            } label:{
                Text("Save")
                    .font(.system(.title2, design: .rounded, weight: .medium))
                    .foregroundStyle(.yell)
                    .frame(height: 40)
                    .frame(maxWidth: screen.width)
                    .background(.purp)
                    .clipShape(.rect(cornerRadius: 15))
            }
            .padding(.all, 20)
        }
    }
}

#Preview {
    SettingsEditTextView(submissionText: .constant(""), title: "Title", description: "Description", placeHolder: "Description...")
}
