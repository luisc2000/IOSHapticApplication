//
//  TermsAndConditions.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 10/2/22.
//

import SwiftUI

struct TermsAndConditions: View {
    @State private var user_agreements: [String] = []
    var body: some View {
        VStack{
            Text("Terms and Conditions").font(.largeTitle)
                .padding(-120)
            
                Text("").onAppear{
                    Task{
                        let (data, _) = try await URLSession.shared.data(from: URL(string:link)!)
                        let decodedResponse = try? JSONDecoder().decode(API.self, from: data)
                        user_agreements = decodedResponse?.user_agreements ?? []
                    }
                }
                    .padding(100)
            
            
            if user_agreements.count > 0
            {
                Text(user_agreements[0])
            }
            
            NavigationLink(destination: ContentView(),label: {
                Text("I Agree")
                    .bold()
                    .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
    }
}

struct TermsAndConditions_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditions()
    }
}
