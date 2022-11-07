//
//  ContentView.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 9/1/22.
//  Option + Command + Enter

import SwiftUI
import AVFoundation
var stack = Stack()
var correct = false
var nums = [1, 5, 4, 7, 8, 2, 9, 6, 3]
var game2 = false
var first = true

//    ! means that it will be initially null but shouldn't be null in the future
    var player: AVAudioPlayer!



struct ContentView: View {
    //var nums = [1, 5, 4, 7, 8, 2, 9, 6, 3] // call this from the API
    @State private var numbers: [Int] = []
    @State private var experiment_description: String = ""
    @State var score = 100
    //nums.shuffle()
    @State var count = 0
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var first: Bool = true

   
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
    
    // decides if the number pressed is correct and adds the number to the stack
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
//                print("1 correct sound: \(button)")
                playSound(fileName: "correct")
                //score = score + 5
                correct = true
            }
            else
            {
                print("2 wrong sound: \(button)")
                playSound(fileName: "wrong")
                //score = score - 2
                correct = false
            }
        }
        else
        {
            if button - stack.peek() == 1
            {
                stack.push(button)
//                print("3 correct sound: \(button)")
                playSound(fileName: "correct")
                correct = true
            }
            else
            {
//                print("4 wrong sound: \(button)")
                playSound(fileName: "wrong")
                correct = false
            }
            
            if stack.len() == 9
            {
                print("Success, move to the next level")
                timerRunning = !timerRunning
                print("You spent \(count) seconds on this level")
                game2 = true
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Text("Score \(score)").id("scoreText")
                if first == true
                {
                    Text("").onAppear{
                        Task{
                            let (data, _) = try await URLSession.shared.data(from: URL(string:link)!)
                            let decodedResponse = try? JSONDecoder().decode(API.self, from: data)
                            print(decodedResponse)
                            numbers = decodedResponse?.numbers ?? []
                        }
                        if numbers.count > 0
                        {
                            nums = numbers
                            first = false
                        }
                        
                    }
                    
                }
                HStack {
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
                               label: {Text(String(nums[0])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                        
                        
                        Button(action: {
                            stackLogic(button: nums[1])
                            if correct {
                                score = score + 5
                                
                            }
                            else{
                                score = score - 2
                            }
                        },
                               label: {Text(String(nums[1])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                        
                        Button(action: {
                            stackLogic(button: nums[2])
                            if correct {
                                score = score + 5
                                
                            }
                            else{
                                score = score - 2
                            }
                        },
                               label: {Text(String(nums[2])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                        //
                    }
                }
                
                HStack {
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
                               label: {Text(String(nums[3])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                        
                        Button(action: {
                            stackLogic(button: nums[4])
                            if correct{
                                score = score + 5
                                
                            }
                            else{
                                score = score - 2
                            }
                        },
                               label: {Text(String(nums[4])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                        
                        Button(action: {
                            stackLogic(button: nums[5])
                            if correct{
                                score = score + 5
                                
                            }
                            else{
                                score = score - 2
                            }
                        },
                               label: {Text(String(nums[5])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    }
                }
                
                HStack {
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
                               label: {Text(String(nums[6])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                        
                        Button(action: {
                            stackLogic(button: nums[7])
                            if correct{
                                score = score + 5
                                
                            }
                            else{
                                score = score - 2
                            }
                        },
                               label: {Text(String(nums[7])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                        
                        Button(action: {
                            stackLogic(button: nums[8])
                            if correct{
                                score = score + 5
                                
                            }
                            else{
                                score = score - 2
                            }
                        },
                               label: {Text(String(nums[8])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    }
                }
//                Button(action: {
//                    timerRunning = !timerRunning
//                    playSound(fileName: "click")
//                },
//                       label: {Text("Timer: \(count)").onReceive(timer) {_ in
//                    if timerRunning {
//                        count += 1
//                    }
//                } .frame(width: 150, height: 60).background(Color(red: 173 / 255, green: 216 / 255, blue: 230 / 255)).foregroundColor(Color.black)}).navigationBarBackButtonHidden(true)
            }
            
        }
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
        ContentView()
            .previewDevice("iPhone 11")
    }
}
