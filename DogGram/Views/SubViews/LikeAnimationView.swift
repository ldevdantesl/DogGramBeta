//
//  LikeAnimationView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 8.02.2024.
//

import SwiftUI

struct LikeAnimationView: View {
    @Binding var animate: Bool

    var body: some View {
        ZStack{
            Image(systemName: "heart.fill")
                .foregroundStyle(.red.opacity(0.3))
                .font(.system(size: 200))
                .opacity(animate ? 1.0 : 0)
                .scaleEffect(animate ? 1.0 : 0.4)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.red.opacity(0.6))
                .font(.system(size: 150))
                .opacity(animate ? 1.0 : 0)
                .scaleEffect(animate ? 1.0 : 0.4)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.red.opacity(0.9))
                .font(.system(size: 100))
                .opacity(animate ? 1.0 : 0)
                .scaleEffect(animate ? 1.0 : 0.4)
        }
    }
}

#Preview {
    LikeAnimationView(animate: .constant(true))
}
