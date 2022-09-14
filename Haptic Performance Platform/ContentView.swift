//
//  ContentView.swift
//  Haptic Performance Platform
//
//  Created by Luis Contreras on 9/1/22.
//  Option + Command + Enter

import SwiftUI
import AVFoundation
var stack = Stack()
//myStack.push(3)

//    ! means that it will be initially null but shouldn't be null in the future
    var player: AVAudioPlayer!



struct ContentView: View {
    var nums = [1, 5, 4, 7, 8, 2, 9, 6, 3] // call this from the API
    
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
            }
            else
            {
                print("2 wrong sound: \(button)")
                playSound(fileName: "wrong")
            }
        }
        else
        {
            if button - stack.peek() == 1
            {
                stack.push(button)
//                print("3 correct sound: \(button)")
                playSound(fileName: "correct")
            }
            else
            {
//                print("4 wrong sound: \(button)")
                playSound(fileName: "wrong")
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
                HStack {
                    Button(action: {stackLogic(button: nums[0])},
                           label: {Text(String(nums[0])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)

                    
                    Button(action: {stackLogic(button: nums[1])},
                           label: {Text(String(nums[1])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {stackLogic(button: nums[2])},
                           label: {Text(String(nums[2])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
//
                }
                
                HStack {
                    Button(action: {stackLogic(button: nums[3])},
                           label: {Text(String(nums[3])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {stackLogic(button: nums[4])},
                           label: {Text(String(nums[4])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {stackLogic(button: nums[5])},
                           label: {Text(String(nums[5])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                }
                
                HStack {
                    Button(action: {stackLogic(button: nums[6])},
                           label: {Text(String(nums[6])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {stackLogic(button: nums[7])},
                           label: {Text(String(nums[7])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                    
                    Button(action: {stackLogic(button: nums[8])},
                           label: {Text(String(nums[8])) .frame(width: 100, height: 100).background(Color(hue: 1.0, saturation: 0.019, brightness: 0.822)).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false)
                }
                
                Button(action: {
                    timerRunning = !timerRunning
                    playSound(fileName: "click")
                },
                       label: {Text("\(count)").onReceive(timer) {_ in
                    if timerRunning {
                        count += 1
                    }
                } .frame(width: 80, height: 60).background(Color.green).foregroundColor(Color.black)})
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}


/*

 stack = []

 while(True):

   button = input()
   button = int(button)

   if len(stack) == 0:
     if button == 1:
           # add button.val to stack and play correct sound
           stack.append(button)
           print("correct sound")
     else:
           # play wrong sound
           print("play wrong sound")
   else:
       if button - stack[-1] == 1:
           stack.append(button)
           print("correct sound")
       else:
           # play wrong sound
           print("play wrong sound")
       if len(stack) == 9:
           # all numbers are on the stack and in order so passed the level
           print("Success, move to the next level")
           break
    
*/
