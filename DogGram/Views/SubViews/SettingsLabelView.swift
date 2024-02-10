//
//  SettingsLabelView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 7.02.2024.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        VStack{
            HStack{
                Text(labelText)
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                Spacer()
                Image(systemName: labelImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            Divider()
        }
        .padding(.horizontal,10)
    }
}

#Preview {
    SettingsLabelView(labelText: "Test Text", labelImage: "heart")
}
