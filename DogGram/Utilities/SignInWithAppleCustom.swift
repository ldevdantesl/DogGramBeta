//
//  SignInWithAppleCustom.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 8.02.2024.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleCustom: UIViewRepresentable{
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) { }
    
}
