//
//  Player4View.swift
//  WoLCounter
//
//  Created by Janeta Paul Vincent Paul on 3/30/22.
//

import SwiftUI

struct Player4View: View {
    @ObservedObject var score: score
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            VStack(spacing: 2){
                //Player 1 Controls
                VStack{
                        Text("Player 1").playerTextStyle(with: 30)
                        HStack(spacing: 2){
                            //Player 1 button -5
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: -5)})
                            { Image("Button5FourPlayer").overlay(Text("-5"))
                            }
                            //Player 1 button -1
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: -1)})
                            { Image("Button1FourPlayer").overlay(Text("-1"))
                            }
                            //Player 1 Score
                            Text("\(score.playerScore)").padding(.horizontal, 5.0).frame(width: 90, height: 50, alignment: .center)
                                .updateScoreTextStyle(with: 45)
                            //Player 1 button +1
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: +1)})
                            { Image("Button1FourPlayer").overlay(Text("+1"))
                            }
                            //Player 1 button +5
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: +5)})
                            { Image("Button5FourPlayer").overlay(Text("+5"))
                            }
                        }// HStack Player 1
                       
                    }// VStack Player 1
                    
                dividerColor()
                    //Player 2 Controls
                    VStack{
                        Text("Player 2").playerTextStyle(with: 30)
                        HStack(spacing: 2){
                            //Player 2 button -5
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: -5)})
                            { Image("Button5FourPlayer").overlay(Text("-5"))
                            }
                            //Player 2 button -1
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: -1)})
                            { Image("Button1FourPlayer").overlay(Text("-1"))
                            }
                            //Player 2 Score
                            Text("\(score.player2Score)").padding(.horizontal, 5.0).frame(width: 90, height: 50, alignment: .center)
                                .updateScoreTextStyle(with: 45)
                            //Player 2 button +1
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: +1)})
                            { Image("Button1FourPlayer").overlay(Text("+1"))
                            }
                            //Player 2 button +5
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: +5)})
                            { Image("Button5FourPlayer").overlay(Text("+5"))
                            }
                        }//HStack Player 2
                       
                    }// VStcak Player 2
                    
                dividerColor()
                    //Player 3 Controls
                    VStack{
                        Text("Player 3").playerTextStyle(with: 30)
                        HStack(spacing: 2){
                            //Player 3 button -5
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: -5)})
                            { Image("Button5FourPlayer").overlay(Text("-5"))
                            }
                            //Player 3 button -1
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: -1)})
                            { Image("Button1FourPlayer").overlay(Text("-1"))
                            }
                            //Player 3 Score
                            Text("\(score.player3Score)").padding(.horizontal, 5.0).frame(width: 90, height: 50, alignment: .center).updateScoreTextStyle(with: 45)
                            //Player 3 button +1
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: +1)})
                            { Image("Button1FourPlayer").overlay(Text("+1"))
                            }
                            //Player 3 button +5
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: +5)})
                            { Image("Button5FourPlayer").overlay(Text("+5"))
                            }
                        }//HStack Player 3
                       
                    }// VStack Player 3
                dividerColor()
                    // Player 4 Controls
                    VStack{
                            Text("Player 4").playerTextStyle(with: 30)
                        HStack(spacing: 2){
                            //Player 4 button -5
                            Button(action: {score.player4Score = updateScore(playerScore: score.player4Score, scoreStep: -5)})
                            { Image("Button5FourPlayer").overlay(Text("-5"))
                            }
                            //Player 4button -1
                            Button(action: {score.player4Score = updateScore(playerScore: score.player4Score, scoreStep: -1)})
                            { Image("Button1FourPlayer").overlay(Text("-1"))
                            }
                            // Player 4 Score
                            Text("\(score.player4Score)").padding(.horizontal, 5.0).frame(width: 90, height: 50, alignment: .center)
                                .updateScoreTextStyle(with: 45)
                            //Player 4 button +1
                            Button(action: {score.player4Score = updateScore(playerScore: score.player4Score, scoreStep: +1)})
                            { Image("Button1FourPlayer").overlay(Text("+1"))
                            }
                            //Player 4 button +5
                            Button(action: {score.player4Score = updateScore(playerScore: score.player4Score, scoreStep: +5)})
                            { Image("Button5FourPlayer").overlay(Text("+5"))
                            }
                        }// HStack Player 4
                       Spacer()
                    } // VStack Player 4
                
            }// main VStack
            .updateScoreButtonStyle()
                .navigationBarItems(leading:
                        //home button
                        Button(action: {self.presentationMode.wrappedValue.dismiss()}){ Image("home_icon")}
                ,trailing:
                        //Reset button
                        Button(action: {score.playerScore = 0
                    score.player2Score = 0
                    score.player3Score = 0
                    score.player4Score = 0
                }) {Image("resetCounter")})
            .myBackground()
            
        }//NavigationView
        .preventScreenSleep()
    }// body
} // struct Player4View

struct Player4View_Previews: PreviewProvider {
    static var previews: some View {
        Player4View(score: score())
    }
}
