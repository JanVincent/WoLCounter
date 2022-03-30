//
//  Helper.swift
//  WoLCounter
//
//  Created by Janeta Paul Vincent Paul on 3/30/22.
//

import SwiftUI

class score: ObservableObject{
    @Published var playerScore: Int16 = 0
    @Published var player2Score: Int16 = 0
    @Published var player3Score: Int16 = 0
    @Published var player4Score: Int16 = 0
}


//for iOS 14.0 compatibality
struct dividerColor: View{
    var body: some View{
        if #available(iOS 15.0, *) {
            Divider().frame(height: 5)
                .background(.black)
        } else {
            Divider().frame(height: 5).background(Color.black)
        }
            
    }
}


// for the app background
struct appBackground: ViewModifier{
    func body(content: Content) -> some View {
        content
            .background(Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .ignoresSafeArea())
    }
}

// for the player text
struct playerText: ViewModifier{
    let textSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("harrington", size: textSize))
            .font(.largeTitle)
    }
}

//for the score text
struct scoreText: ViewModifier{
    let textSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("arial", size: textSize))
            .foregroundColor(Color(red: 0.976, green: 0.965, blue: 0.945))
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.9803), radius: 3, x: 0, y: 3)
    }
}

//for player buttons - Home Page
struct playerButton: ViewModifier{
    let buttonText: String
    func body(content: Content) -> some View {
        content
            .overlay(Text("\(buttonText)"))
            .padding(.bottom)
            .font(.custom("harrington", size: 20))
            .foregroundColor(Color(red: 0.039, green: 0.039, blue: 0.039))
    }
}

//for score update buttons(-1,+1,-5,+5)
struct updateScoreButton: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.custom("Arial Bold", size: 20))
            .foregroundColor(Color(red: 0.035, green: 0.035, blue: 0.035))
    }
}

// to prevent screen sleep
struct ScreenSleep: ViewModifier{
    func body(content: Content) -> some View {
        content
            .onAppear {
                UIApplication.shared.isIdleTimerDisabled = true
            }
            .onDisappear {
                UIApplication.shared.isIdleTimerDisabled = false
            }
    }
}

// for Image in Player 2 button  (+/-1,+/-5)
struct player2Button: ViewModifier{
    let buttonText: String
    func body(content: Content) -> some View {
        content
            .overlay(Text("\(buttonText)").padding())
            .frame(width: 80, height: 60)
    }
}


// extensions for the custom view modifiers
extension View{
    
    func myBackground() -> some View{
        modifier(appBackground())
   }
    
   func playerButtonStyle(with buttonText: String) -> some View{
        modifier(playerButton(buttonText: buttonText))
    }
    
    func playerTextStyle(with textSize : CGFloat) -> some View{
        modifier(playerText(textSize: textSize))
    }
    
    func updateScoreButtonStyle() -> some View{
        modifier(updateScoreButton())
    }
    
    func updateScoreTextStyle(with textSize : CGFloat) -> some View{
        modifier(scoreText(textSize: textSize))
    }
    
    func preventScreenSleep() -> some View{
        modifier(ScreenSleep())
    }
    
    func player2ButtonStyle(with buttonText: String)-> some View{
        modifier(player2Button(buttonText: buttonText))
    }
    
}

// func to limit the score within valid range of 0...999
func updateScore (playerScore : Int16, scoreStep: Int16) -> Int16 {
    var currentScore = playerScore
    if (currentScore + scoreStep) < 0 {
        currentScore = 0
    }
    else if (currentScore + scoreStep) > 999 {
        currentScore = 999
    }
    else {
        currentScore += scoreStep
    }
    
    return currentScore
}
