//
//  JSONTest.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 10/26/22.
//

import SwiftUI
var link: String = "https://68f21c9d-8c26-4281-b296-1e4d5504c672.mock.pstmn.io"
struct JSONTest: View {
    
    @State private var survey_url: String = ""
    @State private var experiment_description: String = ""
    @State private var user_instructions: String = ""
    @State private var user_agreements: [String] = []
    @State private var interaction_type: String = ""
    @State private var linked_files: [String] = []
    @State private var numbers: [Int] = []
    @State private var timer: Bool = false
    @State private var number_of_games: Int = -1
    @State private var game_order: [Int] = []
    
        var body: some View {
            Text(survey_url).onAppear{
                Task{
                    let (data, _) = try await URLSession.shared.data(from: URL(string:"https://asdff.free.beeceptor.com/usc")!)
                    let decodedResponse = try? JSONDecoder().decode(API.self, from: data)
//                    print(decodedResponse)
                    survey_url = decodedResponse?.survey_url ?? ""
                    experiment_description = decodedResponse?.experiment_description ?? ""
                    user_instructions = decodedResponse?.user_instructions ?? ""
                    user_agreements = decodedResponse?.user_agreements ?? []
                    interaction_type = decodedResponse?.user_instructions ?? ""
                    linked_files = decodedResponse?.linked_files ?? []
                    numbers = decodedResponse?.numbers ?? []
                    timer = decodedResponse?.timer ?? false
                    number_of_games = decodedResponse?.number_of_games ?? -1
                    game_order = decodedResponse?.game_order ?? []
                    
                }
            }
            
            Text("survey_url: " + survey_url)
            Text("experiment_description: " + experiment_description)
        }
    }


struct JSONTest_Previews: PreviewProvider {
    static var previews: some View {
        JSONTest()
    }
}
struct API: Codable {
    let survey_url: String
    let experiment_description: String
    let user_instructions: String
    let user_agreements: [String]
    let interaction_type: String
    let linked_files: [String]
    let numbers: [Int]
    let timer: Bool
    let number_of_games: Int
    let game_order: [Int]
}
