//
//  SettingsView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 7.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView{
                HStack{
                    Text("Settings")
                        .font(.system(.largeTitle, design: .rounded, weight: .semibold))
                    Spacer()
                    Image(systemName: "xmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            dismiss()
                        }
                }
                .padding(.horizontal, 10)
                // MARK: - PROFILE BAR
                GroupBox{
                    NavigationLink {
                        SettingsEditTextView(submissionText: .constant("Current Display Name"), title:"Name", description:"You can edit name here. This will be seen by other users on your profile and on your posts", placeHolder: "Name...")
                    } label: {
                        SettingsRowView(rowTitle: "Display Name", rowImage: "pencil", rowColor: .purp)
                    }

                    NavigationLink {
                        SettingsEditTextView(submissionText: .constant("Current Bio"), title:"Bio", description:"Your bio is a great way to let other users know a little about you. It will be shown only on your profile", placeHolder: "Bio...")
                    } label: {
                        SettingsRowView(rowTitle: "Bio", rowImage: "text.quote", rowColor: .purp)
                    }
                    NavigationLink {
                        SettingsEditImageView(selectedImage: UIImage(named: "dog1")!)
                    } label: {
                        SettingsRowView(rowTitle: "Profile's Picture", rowImage: "photo", rowColor: .purp)
                    }
                    NavigationLink {
                        
                    } label: {
                        SettingsRowView(rowTitle: "Sign Out", rowImage: "figure.walk", rowColor: .purp)
                    }
                   
                    
                } label: {
                    SettingsLabelView(labelText: "Profile", labelImage: "person.fill")
                }
                .padding(.horizontal, 10)
                
                GroupBox{
                    Button{
                        
                    } label:{
                        SettingsRowView(rowTitle: "Info", rowImage: "info.circle", rowColor: .yell)
                    }
                    Button{
                        openCustomURL(urlString: "https://www.yahoo.com")
                    } label:{
                        SettingsRowView(rowTitle: "Privacy Policy", rowImage: "doc.text", rowColor: .yell)
                    }
                    Button{
                        openCustomURL(urlString: "https://www.google.com")
                    } label:{
                        SettingsRowView(rowTitle: "Terms & Conditions", rowImage: "list.bullet.rectangle.fill", rowColor: .yell)
                    }
                    Button{
                        openCustomURL(urlString: "https://www.bing.com")
                    } label:{
                        SettingsRowView(rowTitle: "DogGram's Website", rowImage: "globe", rowColor: .yell)
                    }
                    
                } label: {
                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                }
                .padding(.horizontal, 10)
                Spacer()
                
                Text("All Rights Reserved\nDantes Inc.\nCopyright 2024")
                    .font(.system(.footnote, design: .rounded, weight: .semibold))
                    .foregroundStyle(.beige)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
            }
        }
    }
    
    // MARK: - FUNCTIONS
    func openCustomURL(urlString: String){
        guard let url = URL(string: urlString) else {return}
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        
    }
    
}

#Preview {
    SettingsView()
}
