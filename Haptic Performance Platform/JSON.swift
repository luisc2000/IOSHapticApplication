//
//  JSONTest.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 10/26/22.
//

import SwiftUI
var link: String = "https://68f21c9d-8c26-4281-b296-1e4d5504c672.mock.pstmn.io"
struct JSON: View {
    
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
        Text("")
    }
}

struct JSONTest_Previews: PreviewProvider {
    static var previews: some View {
        JSON()
    }
}

// models the JSON object that is returned at https://68f21c9d-8c26-4281-b296-1e4d5504c672.mock.pstmn.io
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
