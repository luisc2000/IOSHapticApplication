//
//  Game2.swift
//  Haptic Performance Platform
//
//  Created by Hanna Kishawi on 10/9/22.
//

import SwiftUI

import SwiftUI
import AVFoundation
var stack2 = Stack()
var correct2 = false
var nums2 = [1, 5, 4, 7, 8, 2, 9, 6, 3, ]
var game3 = false
var player2: AVAudioPlayer!

struct Game2: View {
    @State var score = 100
    
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
            player2 = try AVAudioPlayer(contentsOf: url!)
            player2?.play()
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
        
        if stack2.len() == 0
        {
            if button == 1
            {
                stack2.push(button)
                playSound(fileName: "correctv2")
                HapticsManager.shared.vibrate(for: .success)
                //score = score + 5
                correct2 = true
            }
            else
            {
                playSound(fileName: "wrongv3")
                HapticsManager.shared.vibrate(for: .error)
                //score = score - 2
                correct2 = false
            }
        }
        else
        {
            if button - stack2.peek() == 1
            {
                stack2.push(button)
                playSound(fileName: "correctv2")
                correct2 = true
            }
            else
            {
                playSound(fileName: "wrongv3")
                correct2 = false
            }
            
            if stack2.len() == 9
            {
                timerRunning = !timerRunning // turn the timer off
                game3 = true
            }
        }
    }
    
    // the GUI of the game. It uses ZStack, HStack, and VStack. Very similar to game1 but instead of buttons, numbers are placed in an (x,y) position. This game is not configured to call the JSON file. Needs that to be done. Can be done very similar to Game1 API call.
    var body: some View {
        ZStack {
            Text("Score \(score)").id("scoreText")
            
            Button(action: {
                stackLogic(button: nums2[0])
                if correct2{
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[0])) .frame(width: 50, height: 50).background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 10, y: 10)
            
            
            Button(action: {
                stackLogic(button: nums2[1])
                if correct2 {
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[1])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 100, y: 100)
            
            Button(action: {
                stackLogic(button: nums2[2])
                if correct2 {
                    score = score + 5
                    
                }
                else if (score > 1){
                    score = score - 2
                }
                else {
                    score = 0;
                }
            },
                   label: {Text(String(nums2[2])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 50, y: 200)
            
            Button(action: {
                stackLogic(button: nums2[3])
                if correct2 {
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[3])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 80, y: 400)
            
            Button(action: {
                stackLogic(button: nums2[4])
                if correct2{
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[4])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 350, y: 300)
            
            Button(action: {
                stackLogic(button: nums2[5])
                if correct2{
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[5])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 150, y: 500)
            
            Button(action: {
                stackLogic(button: nums2[6])
                if correct2 {
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[6])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 300, y: 600)
            
            Button(action: {
                stackLogic(button: nums2[7])
                if correct2{
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[7])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 230, y: 440)
            
            Button(action: {
                stackLogic(button: nums2[8])
                if correct2{
                    score = score + 5
                    
                }
                else{
                    score = score - 2
                }
            },
                   label: {Text(String(nums2[8])) .background(Color.clear).cornerRadius(22).foregroundColor(Color.black).font(.system(size: 40, weight: Font.Weight.regular))}).disabled(false).position(x: 220, y: 170).navigationBarBackButtonHidden(true)
        }
        
        if game3 == true {
            
            NavigationLink(destination: Game3(),label: {
                Text("Go to Game3!")
                    .bold()
                    .frame(width: 280, height: 50).background(Color(red: 100 / 255, green: 149 / 255, blue: 237 / 255))
                    .foregroundColor(.white)
                    .cornerRadius(10).navigationBarBackButtonHidden(true)
            })
        }
    }
}

struct Game2_Previews: PreviewProvider {
    static var previews: some View {
        Game2()
            .previewDevice("iPhone 11")
    }
}

