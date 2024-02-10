//
//  OnBoardingView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 8.02.2024.
//

import SwiftUI

struct OnBoardingView: View {
    @State var animation: CGFloat = 100
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Image("logo.transparent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
               Text("DogGram")
                    .font(.system(.title, design: .rounded, weight: .semibold))
                    .foregroundStyle(.yell)
            }
            if animation == 700{
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: screen.width - 20)
                    .background(.beige)
                    .clipShape(.rect(cornerRadius: 15))
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: screen.width - 20)
                    .background(.beige)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.bottom, 10)
                
                SignInWithAppleCustom()
                    .frame(height: 50)
                    .frame(maxWidth: screen.width - 40)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.vertical, 10)
                
                Button{
                    
                } label:{
                    HStack{
                        Image(systemName: "globe")
                            .foregroundStyle(.white)

                        
                        Text("Sign in with Google")
                            .foregroundStyle(.white)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: screen.width - 40)
                    .background(Color(.init(srgbRed: 222/255, green: 82/255, blue: 70/255, alpha: 1)))
                    .clipShape(.rect(cornerRadius: 15))
                    
                    
                }
                .padding(.vertical, 10)
                Button{
                } label:{
                    Text("Continue as guest.")
                        .font(.system(.headline, design: .rounded, weight: .bold))
                }
            }
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                withAnimation {
                    animation = 700
                }
            }
        }
    }
}

#Preview {
    OnBoardingView()
}
