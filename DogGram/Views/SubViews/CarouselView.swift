//
//  CarouselView.swift
//  DogGram
//
//  Created by Buzurg Rakhimzoda on 6.02.2024.
//

import SwiftUI

struct CarouselView: View {
    @State private var selection: Int = 0
    @State private var timerAdded: Bool = true
    let maxCount: Int = 8
    
    var body: some View {
        TabView(selection: $selection){
            ForEach(1..<8){ cnt in
                Image("dog\(cnt)")
                    .resizable()
                    .scaledToFit()
                    .tag(cnt)
                    
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 265)
        .onAppear{
            if !timerAdded{
                addTimer()
            }
        }
    }
    // MARK: - TIMER
    
    func addTimer(){
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            withAnimation {
                
                if selection == (maxCount - 1) {
                    selection = 0
                } else {
                    selection += 1
                }
                
            }
        }
        
        timer.fire()
    }
}

#Preview {
    CarouselView()
}
