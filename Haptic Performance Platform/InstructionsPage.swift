//
//  InstructionsPage.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 9/23/22.
//

import SwiftUI

struct InstructionsPage: View {
    var body: some View {
        VStack{
            Text("Welcome to Game #1")
            Text("Tap on the numbers in order from 1 - 9")
        }
    }
}

struct InstructionsPage_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsPage()
    }
}
