//
//  InstructionsPage.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 9/23/22.
//

import SwiftUI

struct DetailsPage: View {
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Participant ID")
                TextField("Participant ID here", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(20)
                    .background(Color(red: 255 / 255, green: 242 / 255, blue: 204 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding()
                
                Text("Experiment ID")
                TextField("Experiment ID here", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(20)
                    .background(Color(red: 255 / 255, green: 242 / 255, blue: 204 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding()
//                Text("Welcome to Game #1")
//                Text("Tap on the numbers in order from 1 - 9")
                NavigationLink(destination: InstructionsPage(),label: {
                    Text("Start Game")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color(red: 27 / 255, green: 153 / 255, blue: 136 / 255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage()
            .previewDevice("iPhone 11")
    }
}
