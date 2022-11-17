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
//myStack.push(3)
var nums2 = [1, 5, 4, 7, 8, 2, 9, 6, 3, ]/*.shuffled()*/
//    ! means that it will be initially null but shouldn't be null in the future
    //var player2: AVAudioPlayer!
var game3 = false
var randomInt = CGFloat.random(in: 10..<800)
var player2: AVAudioPlayer!

struct Game2: View {
    //var nums = [1, 5, 4, 7, 8, 2, 9, 6, 3, ] // call this from the API
    @State var score = 100
    
    @State var count = 0
    @State var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var first: Bool = true

    func generateRandNum() -> CGFloat // are we getting this from API?
    {
        return CGFloat.random(in: 10..<800)
    }
    
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
    
    // decides if the number pressed is correct2 and adds the number to the stack2
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
                print("1 correct sound: \(button)")
                playSound(fileName: "correctv2")
                HapticsManager.shared.vibrate(for: .success)
                //score = score + 5
                correct2 = true
            }
            else
            {
                print("2 wrong sound: \(button)")
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
                print("3 correct sound: \(button)")
                playSound(fileName: "correctv2")
                correct2 = true
            }
            else
            {
                print("4 wrong sound: \(button)")
                playSound(fileName: "wrongv3")
                correct2 = false
            }
            
            if stack2.len() == 9
            {
                print("Success, move to the next level")
                timerRunning = !timerRunning
                print("You spent \(count) seconds on this level")
                game3 = true
            }
        }
    }
    
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

