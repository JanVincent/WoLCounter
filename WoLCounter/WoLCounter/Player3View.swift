//
//  Player3View.swift
//  WoLCounter
//
//  Created by Janeta Paul Vincent Paul on 3/30/22.
//

import SwiftUI

struct Player3View: View {
    @ObservedObject var score: score
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            VStack(spacing: 2){
                //Player 1 Controls
                VStack(spacing: 15){
                    Text("Player 1").playerTextStyle(with: 40)
                    HStack(spacing: 30){
                        VStack(spacing: 2){
                            //Player 1 button -1
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: -1)})
                            { Image("Button1TwoPlayer").overlay(Text("-1"))
                            }
                            //Player 1 button -5
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: -5)})
                            { Image("Button5TwoPlayer").overlay(Text("-5"))
                            }
                        }
                        //Player 1 Score
                        Text("\(score.playerScore)")
                            .frame(width: 140, height: 50, alignment: .center)
                            .updateScoreTextStyle(with: 80)
                        VStack(spacing: 2){
                            //Player 1 button +1
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: +1)})
                            { Image("Button1TwoPlayer").overlay(Text("+1"))
                            }
                            //Player 1 button +5
                            Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: +5)})
                            { Image("Button5TwoPlayer").overlay(Text("+5"))
                            }
                        }//VStack
                        
                    }//HStack Player 1
                }//Vstack Player 1
                
                dividerColor()
                
                //Player 2 Controls
                VStack(spacing: 15){
                    Text("Player 2").playerTextStyle(with: 40)
                    HStack(spacing: 30){
                        VStack(spacing: 2){
                            //Player 2 button -1
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: -1)})
                            { Image("Button1TwoPlayer").overlay(Text("-1"))
                            }
                            //Player 2 button -5
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: -5)})
                            { Image("Button5TwoPlayer").overlay(Text("-5"))
                            }
                        }//VStack
                        //Player 2 Score
                        Text("\(score.player2Score)")
                            .frame(width: 140, height: 50, alignment: .center)
                            .updateScoreTextStyle(with: 80)
                        VStack(spacing: 2){
                            //Player 2 button +1
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: +1)})
                            { Image("Button1TwoPlayer").overlay(Text("+1"))
                            }
                            //Player 2 button +5
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: +5)})
                            { Image("Button5TwoPlayer").overlay(Text("+5"))
                            }
                        }//VStack
                        
                    }//HStack Player 3
                }//VStack Player 3
                
                dividerColor()
                //Player 3 Controls
                VStack(spacing: 15){
                    Text("Player 3").playerTextStyle(with: 40)
                    HStack(spacing: 30){
                        VStack(spacing: 2){
                            //Player 3 button -1
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: -1)})
                            { Image("Button1TwoPlayer").overlay(Text("-1"))
                            }
                            //Player 3 buton -5
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: -5)})
                            { Image("Button5TwoPlayer").overlay(Text("-5"))
                            }
                        }// VStack
                        //Player3 Score
                        Text("\(score.player3Score)")
                            .frame(width: 140, height: 50, alignment: .center)
                            .updateScoreTextStyle(with: 80)
                        VStack(spacing: 2){
                            //Player 3 button +1
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: +1)})
                            { Image("Button1TwoPlayer").overlay(Text("+1"))
                            }
                            //Player 3 button +5
                            Button(action: {score.player3Score = updateScore(playerScore: score.player3Score, scoreStep: +5)})
                            { Image("Button5TwoPlayer").overlay(Text("+5"))
                            }
                        }//VStack
                    } //HStack Player 3
                }//VStack Player 3
                .padding(.bottom)
            
            
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
    Spacer()
    }//NavigationView
        .preventScreenSleep()
    }// body
}// Struct Player3View

struct Player3View_Previews: PreviewProvider {
    static var previews: some View {
        Player3View(score: score())
    }
}
