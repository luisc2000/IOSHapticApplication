//
//  ContentView.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 9/1/22.

import SwiftUI
import AVFoundation
var stack = Stack()
var correct = false
var nums = [1, 5, 4, 7, 8, 2, 9, 6, 3]
var game2 = false
var first = true

//    ! means that it will be initially null but shouldn't be null in the future
// audio player
var player: AVAudioPlayer!

struct Game1: View {
    //var nums = [1, 5, 4, 7, 8, 2, 9, 6, 3] // call this from the API
    @State private var numbers: [Int] = []
    @State private var experiment_description: String = ""
    @State var score = 100
    //nums.shuffle()
    @State var count = 0
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var first: Bool = true
    
    
    /// This is a helper function that plays the sound given by the parameter
    ///
    /// - Important: Make sure that the file is in the current directory.
    ///
    /// Usage:
    ///
    ///     playSound(fileName: "correctv2")
    ///
    /// - Parameter fileName: The name of the file
    func playSound(fileName: String)
    {
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        guard url != nil else
        {
            return
        }
        
        do
        {
            player = try AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
        catch
        {
            print("/(error)")
        }
    }
    
    
    /// Function that implements the logic of the game using a stack data structure. This function decides if the number pressed is correct. If it is then the appropriate sound is played.
    ///
    /// Usage:
    ///
    ///     stackLogic(button: 1)
    ///
    /// - Parameter button: The number that is to be checked.
    func stackLogic(button: Int)
    {
        if first
        {
            timerRunning = !timerRunning // turn on the timer
            first = false
        }
        
        if stack.len() == 0
        {
            if button == 1
            {
                stack.push(button)
                playSound(fileName: "correctv2")
                HapticsManager.shared.vibrate(for: .success)
                correct = true
            }
            else
            {
                playSound(fileName: "wrongv3")
                HapticsManager.shared.vibrate(for: .error)
                correct = false
            }
        }
        else
        {
            if button - stack.peek() == 1
            {
                stack.push(button)
                playSound(fileName: "correctv2")
                correct = true
            }
            else
            {
                playSound(fileName: "wrongv3")
                correct = false
            }
            
            if stack.len() == 9
            {
                timerRunning = !timerRunning // turn the timer off
                game2 = true
            }
        }
    }
    
    // the GUI of the game. It uses ZStack, HStack, and VStack. This game is configured based on the JSON retrieved from the API call. Might need to make it more configurable to play haptics from the JSON file.
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack (spacing: 0){
                    Text("Score \(score)").id("scoreText")
                    if first == true
                    {
                        // this calls the API given by the "link" string that is defined in JSON file
                        Text("").onAppear{
                            Task{
                                let (data, _) = try await URLSession.shared.data(from: URL(string:link)!)
                                let decodedResponse = try? JSONDecoder().decode(API.self, from: data)
                                print(decodedResponse!)
                                numbers = decodedResponse?.numbers ?? []
                            }
                            if numbers.count > 0
                            {
                                nums = numbers
                                first = false
                            }
                            
                        }
                    }
                    HStack (spacing: 0){
                        Section{
                            Button(action: {
                                stackLogic(button: nums[0])
                                if correct{
                                    score = score + 5
                                }
                                else if (score > 1){
                                    score = score - 2
                                }
                                else {
                                    score = 0;
                                }
                            },
                                   label: {Text(String(nums[0])) .frame(width: geometry.size.width * 0.222, height: geometry.size.width * 0.222).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                                .padding(geometry.size.width * 0.03).padding(.bottom, 0)
                            
                            
                            Button(action: {
                                stackLogic(button: nums[1])
                                if correct {
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[1])) .frame(width: geometry.size.width * 0.222, height: geometry.size.width * 0.222).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03)
                            
                            Button(action: {
                                stackLogic(button: nums[2])
                                if correct {
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[2])) .frame(width: geometry.size.width * 0.222, height: geometry.size.width * 0.222).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03)
                        }
                    }
                    
                    HStack (spacing: 0){
                        Section {
                            Button(action: {
                                stackLogic(button: nums[3])
                                if correct {
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[3])) .frame(width: geometry.size.width * 0.22, height: geometry.size.width * 0.22).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03)
                            
                            Button(action: {
                                stackLogic(button: nums[4])
                                if correct{
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[4])) .frame(width: geometry.size.width * 0.22, height: geometry.size.width * 0.22).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03)
                            
                            Button(action: {
                                stackLogic(button: nums[5])
                                if correct{
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[5])) .frame(width: geometry.size.width * 0.22, height: geometry.size.width * 0.22).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03)
                        }
                    }
                    
                    HStack (spacing: 0){
                        Section {
                            Button(action: {
                                stackLogic(button: nums[6])
                                if correct {
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[6])) .frame(width: geometry.size.width * 0.22, height: geometry.size.width * 0.22).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03)
                            
                            Button(action: {
                                stackLogic(button: nums[7])
                                if correct{
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[7])) .frame(width: geometry.size.width * 0.22, height: geometry.size.width * 0.22).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03)
                            
                            Button(action: {
                                stackLogic(button: nums[8])
                                if correct{
                                    score = score + 5
                                    
                                }
                                else{
                                    score = score - 2
                                }
                            },
                                   label: {Text(String(nums[8])) .frame(width: geometry.size.width * 0.22, height: geometry.size.width * 0.22).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).padding(geometry.size.width * 0.03).navigationBarBackButtonHidden(true)
                        }
                    }.padding(.horizontal, geometry.size.width * 0.1)
                    
                }.padding(.vertical, geometry.size.width * 0.4)
            }
        }
        // only move to the next level if all buttons were pressed. This boolean is set in stackLogic
        if game2 == true {
            
            NavigationLink(destination: Game2(),label: {
                Text("Go to Game2!")
                    .bold()
                    .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                    .foregroundColor(.white)
                    .cornerRadius(10).navigationBarBackButtonHidden(true)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Game1()
            .previewDevice("iPhone 11")
    }
}
