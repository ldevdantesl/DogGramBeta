//
//  BrowseView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import SwiftUI

struct BrowseView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack{
                    Text("Search")
                        .font(.system(.title, design: .rounded, weight: .semibold))
                        .padding(.horizontal, 10)
                        .foregroundStyle(colorScheme == .dark ? .yell : .purp)
                    Spacer()
                }.frame(width: screen.width, height: 30)
                CarouselView()
                ImageGridView()
            }
        }
    }
}

#Preview {
    BrowseView()
}
