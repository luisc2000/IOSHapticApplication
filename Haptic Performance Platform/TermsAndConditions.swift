//
//  TermsAndConditions.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 10/2/22.
//

import SwiftUI

struct TermsAndConditions: View {
    var body: some View {
        //NavigationView{
            VStack{
                Text("Terms and Conditions").font(.largeTitle)
                    .padding(-120)
                
                Text("By clicking on the button below I certify that I agree to the terms and conditions.")
                    .padding(100)
                
                NavigationLink(destination: ContentView(),label: {
                    Text("I Agree")
                        .bold()
                        .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
        //}
    }
}

struct TermsAndConditions_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditions()
    }
}
