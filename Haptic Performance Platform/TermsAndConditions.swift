//
//  TermsAndConditions.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 10/2/22.
//

import SwiftUI

struct TermsAndConditions: View {
    @State private var user_agreements: [String] = []
    @State var isOn: Bool = false
    @State var isOn1: Bool = false
    var body: some View {
        VStack{
            Text("Terms and Conditions").font(.largeTitle)
                .padding(-120)
            
            // this calls the API given by the "link" string that is defined in JSON file and populates the user agreement with the user agreement retrieved from the JSON
            Text("").onAppear{
                Task{
                    let (data, _) = try await URLSession.shared.data(from: URL(string:link)!)
                    let decodedResponse = try? JSONDecoder().decode(API.self, from: data)
                    user_agreements = decodedResponse?.user_agreements ?? []
                }
            }
            .padding(100)
            
            // radio buttons that the user must switch on before moving to the next page
            Toggle("Agree to all terms and conditions", isOn: $isOn)
                .padding()
            // radio buttons that the user must switch on before moving to the next page
            Toggle("Agree to all terms and conditions", isOn: $isOn1)
                .padding()
            
            if user_agreements.count > 0
            {
                Text(user_agreements[0])
            }
            
            // only move to the next page if both radio buttons are on
            if isOn && isOn1{
                NavigationLink(destination: InstructionsPage(),label: {
                    Text("I Agree")
                        .bold()
                        .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
        }
    }
}

struct TermsAndConditions_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditions()
    }
}
