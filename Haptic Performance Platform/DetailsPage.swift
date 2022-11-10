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
    @State var email = "";
    @State var moveon = false;
    @State var moveon1 = false;
    @State var isEmailValid = false;
    
//    func textFieldValidatorEmail(_ string: String) -> Bool {
//            if string.count > 100 {
//                return false
//            }
//            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // short format
//            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
//            return emailPredicate.evaluate(with: string)
//    }
//    @State private var username: String = ""
    var body: some View {
        
        
        
        NavigationView{
            VStack{
                
//                TextField("Email", text: $email, onEditingChanged: { (isChanged) in
//                                 if !isChanged {
//                                      if self.textFieldValidatorEmail(self.email) {
//                                        self.isEmailValid = true
//                                      } else {
//                                        self.isEmailValid = false
////                                        self.email = ""
//                                      }
//                                     print("email is: ", self.isEmailValid)
//                                }
//                })
//                .autocapitalization(.none)
//
//                if !self.isEmailValid {
//                      Text("Email is not valid")
//                }

                
                
                Text("iOS Haptic App").font(.largeTitle)
                    .padding(-120)
                Text("Participant ID")
                
                TextField("Participant ID here", text: $parID).padding(10).background(Color(red: 240 / 255, green: 255 / 255, blue: 255 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding(20)
                    .onChange(of: parID) { [parID] newValue in
                        if parID.contains(" "){
                            moveon = false
//                            print("space: ",parID)
                        }
                        else {
                            moveon = true
//                            print("no space: ",parID)
                        }
                        print("parID: ",$parID)
                    }
                //showAlert = parID.contains(" ");
//
                Text("Experiment ID")
                TextField("Experiment ID here", text: $expID).padding(10).background(Color(red: 240 / 255, green: 255 / 255, blue: 255 / 255))
                    .background(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 3)
                    ).padding()
                    .onChange(of: expID) { [expID] newValue in
                        if expID.contains(" "){
                            moveon1 = false
                            print("space: ",parID)
                        }
                        else {
                            moveon1 = true
                            print("no space: ",parID)
                        }
                        
                        
                    }
                
                if moveon == true && moveon1 == true{
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
