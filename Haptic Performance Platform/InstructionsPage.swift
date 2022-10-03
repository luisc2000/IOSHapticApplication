//
//  InstructionsPage.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 10/2/22.
//

import SwiftUI

struct InstructionsPage: View {
    var body: some View {
        //NavigationView{
            VStack{
                Text("Welcome to Game #1").font(.largeTitle)
                    .padding(-120)
                Text("Tap on the numbers in order from 1 - 9")
                    .padding(100)
                
                NavigationLink(destination: TermsAndConditions(),label: {
                    Text("Continue")
                        .bold()
                        .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
        //}
    }
}

struct InstructionsPage_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsPage()
    }
}
