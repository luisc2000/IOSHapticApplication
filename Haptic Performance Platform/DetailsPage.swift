//
//  InstructionsPage.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 9/23/22.
//

import SwiftUI
var space = " ";
struct DetailsPage: View {
    @State var parID = "";
    @State var expID = "";
    @State var isEmailValid = false;
    @State var isEmailValid2 = false;
    func textFieldValidatorEmail() -> Bool {
            if parID.contains(" ") {
                return false
            }
            return true
    }
    
    func textFieldValidatorEmail1() -> Bool {
        if expID.contains(" ") {
                return false
            }
            return true
    }
    
    var body: some View {
        
        
        
        NavigationView{
            VStack{
                
                Text("iOS Haptic App").font(.largeTitle)
                    .padding(-120)
                Text("Participant ID")
                
                TextField("Participant ID here", text: $parID).padding(10).background(Color(red: 240 / 255, green: 255 / 255, blue: 255 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding(20)
                
                if !textFieldValidatorEmail() {
                      Text("Please remove any spaces from the Participant ID")
                }
//
                Text("Experiment ID")
                TextField("Experiment ID here", text: $expID).padding(10).background(Color(red: 240 / 255, green: 255 / 255, blue: 255 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding(20)
                
                if !textFieldValidatorEmail1() {
                      Text("Please remove any spaces from the Experiment ID")
                }
                
                if textFieldValidatorEmail() && textFieldValidatorEmail1() && (parID != "" && expID != ""){
                    NavigationLink(destination: TermsAndConditions(),label: {
                        Text("Start Game")
                            .bold()
                            .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
                
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
