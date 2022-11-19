//
//  InstructionsPage.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 9/23/22.
//

import SwiftUI
var space = " ";
struct DetailsPage: View {
    @State var participantID = "";
    @State var experimentID = "";
    
    /// This is a helper function that validates the Participant ID textfield
    ///
    /// Usage:
    ///
    ///     textFieldValidatorParticipantID()
    ///
    func textFieldValidatorParticipantID() -> Bool {
        if participantID.contains(" ") {
            return false
        }
        return true
    }
    
    /// This is a helper function that validates the Experiment ID textfield
    ///
    /// Usage:
    ///
    ///     textFieldValidatorParticipantID()
    ///
    func textFieldValidatorExperimentID() -> Bool {
        if experimentID.contains(" ") {
            return false
        }
        return true
    }
    
    var body: some View {
        // NavigationView allows us to navigate to a different file via the NavigationLink function
        NavigationView{
            VStack{
                Text("iOS Haptic App").font(.largeTitle)
                    .padding(-120)
                Text("Participant ID")
                
                TextField("Participant ID here", text: $participantID).padding(10).background(Color(red: 240 / 255, green: 255 / 255, blue: 255 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding(20)
                
                if !textFieldValidatorParticipantID() {
                    Text("There is an error in the Participant ID").foregroundColor(.red)
                }
                //
                Text("Experiment ID")
                TextField("Experiment ID here", text: $experimentID).padding(10).background(Color(red: 240 / 255, green: 255 / 255, blue: 255 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding(20)
                
                if !textFieldValidatorExperimentID() {
                    Text("There is an error in the Experiment ID").foregroundColor(.red)
                }
                
                // if both the ParticipantID and the Experiment ID are valid then move on to the next page.
                if textFieldValidatorParticipantID() && textFieldValidatorExperimentID() && (participantID != "" && experimentID != ""){
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
