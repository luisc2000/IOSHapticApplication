//
//  InstructionsPage.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 10/2/22.
//

import SwiftUI

struct InstructionsPage: View {
    var body: some View {
        
        NavigationLink(destination: ContentView(),label: {
            Text("Ok")
                .bold()
                .frame(width: 280, height: 50).background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        })
    }
}

struct InstructionsPage_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsPage()
    }
}
