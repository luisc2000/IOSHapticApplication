//
//  Game2.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 10/9/22.
//

import SwiftUI

import SwiftUI
import AVFoundation
//var stack = Stack()
//var correct = false
//myStack.push(3)
var nums2 = [1, 5, 4, 7, 8, 2, 9, 6, 3, ].shuffled()
//    ! means that it will be initially null but shouldn't be null in the future
    //var player: AVAudioPlayer!



struct Game2: View {
    //var nums = [1, 5, 4, 7, 8, 2, 9, 6, 3, ] // call this from the API
    @State var score = 100
    
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
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("Score \(score)").id("scoreText")

//                Button(action: {
//                    timerRunning = !timerRunning
//                    playSound(fileName: "click")
//                },
//                       label: {Text("Score: \(score)").onReceive(timer) {_ in
//                    if timerRunning {
//                        if soundStack.peek() == 1{
//                            score = score + 5
//                        }
//                        else {
//                            score = score - 2
//                        }
//                        //count += 1
//                    }
//                } .frame(width: 100, height: 60).background(Color.green).foregroundColor(Color.black)})
                HStack {
                    
                    Button(action: {
                        stackLogic(button: nums2[0])
                        if correct{
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[0])) .frame(width: 50, height: 50).background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)

                    
                    Button(action: {
                        stackLogic(button: nums2[1])
                        if correct {
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[1])) .frame(width: 100, height: 100).background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {
                        stackLogic(button: nums2[2])
                        if correct {
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[2])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
//
                }
                
                HStack {
                    Button(action: {
                        stackLogic(button: nums2[3])
                        if correct {
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[3])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {
                        stackLogic(button: nums2[4])
                        if correct{
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[4])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {
                        stackLogic(button: nums2[5])
                        if correct{
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[5])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                }
                
                HStack {
                    Button(action: {
                        stackLogic(button: nums2[6])
                        if correct {
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[6])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {
                        stackLogic(button: nums2[7])
                        if correct{
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[7])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {
                        stackLogic(button: nums2[8])
                        if correct{
                            score = score + 5
                            
                        }
                        else{
                            score = score - 2
                        }
                    },
                           label: {Text(String(nums2[8])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                }
                
                Button(action: {
                    timerRunning = !timerRunning
                    playSound(fileName: "click")
                },
                       label: {Text("Timer: \(count)").onReceive(timer) {_ in
                    if timerRunning {
                        count += 1
                    }
                } .frame(width: 150, height: 60).background(Color(red: 173 / 255, green: 216 / 255, blue: 230 / 255)).foregroundColor(Color.black)})
            }
            
        }
    }
}

struct Game2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}

