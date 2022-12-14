//
//  InstructionsPage.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 10/2/22.
//

import SwiftUI

// instruction page before entering game1
struct InstructionsPage: View {
    @State private var experiment_description: String = ""
    var body: some View {
        
        VStack{
            Text("Welcome to Game #1").font(.largeTitle)
                .padding(-120)
            
            // this calls the API given by the "link" string that is defined in JSON file and populates the experiment_description with the experiment_description retrieved from the JSON
            Text(experiment_description).onAppear{
                Task{
                    let (data, _) = try await URLSession.shared.data(from: URL(string:link)!)
                    let decodedResponse = try? JSONDecoder().decode(API.self, from: data)
                    experiment_description = decodedResponse?.experiment_description ?? ""
                }
            }
            .padding(.bottom, 100)
            .padding(.top, 100)
            
            NavigationLink(destination: Game1(),label: {
                Text("Continue")
                    .bold()
                    .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
    }
}

struct InstructionsPage_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsPage()
    }
}
