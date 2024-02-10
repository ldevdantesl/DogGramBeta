//
//  SettingsRowView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 7.02.2024.
//

import SwiftUI

struct SettingsRowView: View {
    
    var rowTitle: String
    var rowImage: String
    var rowColor: Color
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(rowColor)
                
                Image(systemName: rowImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
            }
            .frame(width: 40, height: 40)
        
            Text(rowTitle)
                .font(.system(.headline, design: .rounded, weight: .semibold))
                .foregroundStyle(.tint)
            
            Spacer()
            Image(systemName:"chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundStyle(.tint)
        }
        .tint(.primary)
        .padding(.horizontal,5)
        .padding(.vertical,5)
    }
}

#Preview {
    SettingsRowView(rowTitle: "Test Title", rowImage: "heart.fill", rowColor: .black)
}
