//
//  Player2View.swift
//  WoLCounter
//
//  Created by Janeta Paul Vincent Paul on 3/30/22.
//

import SwiftUI

struct Player2View: View {
    @ObservedObject var score: score
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            VStack(spacing: 2){
                //Player 1 Controls
                VStack(spacing: 2){
                    Text("Player 1")
                        .playerTextStyle(with: 40)
                    //Player 1 Score
                    Text("\(score.playerScore)")
                        .updateScoreTextStyle(with: 100)
                    HStack(spacing: 30){
                        //Player 1 button -1
                        Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: -1)})
                        { Image("Button1TwoPlayer")
                                .resizable()
                                .player2ButtonStyle(with: "-1")
                        }
                        //Player 1 button +1
                        Button(action: {score.playerScore  = updateScore(playerScore: score.playerScore, scoreStep: +1)})
                        { Image("Button1TwoPlayer")
                                .resizable()
                                .player2ButtonStyle(with: "+1")
                        }
                    }//HStack
                    HStack(spacing: 30){
                        //Player 1 button -5
                        Button(action: {score.playerScore  = updateScore(playerScore: score.playerScore, scoreStep: -5)})
                        { Image("Button5TwoPlayer")
                                .resizable()
                                .player2ButtonStyle(with: "-5")
                        }
                        //Player 1 button +5
                        Button(action: {score.playerScore  = updateScore(playerScore: score.playerScore, scoreStep: +5)})
                        { Image("Button5TwoPlayer")
                                .resizable()
                                .player2ButtonStyle(with: "+5")
                        }
                    }//HStack
                }//VStack Player 1
                dividerColor()
                //Player 2 Controls
                VStack(spacing: 2){
                    Text("Player 2")
                        .playerTextStyle(with: 40)
                        .padding(.top)
                    //Player 2 Score
                    Text("\(score.player2Score)")
                        .updateScoreTextStyle(with: 100)
                        HStack(spacing: 30){
                            //Player 2 button -1
                            Button(action: {score.player2Score = updateScore(playerScore: score.player2Score, scoreStep: -1)})
                            { Image("Button1TwoPlayer")
                                    .resizable()
                                    .player2ButtonStyle(with: "-1")
                            }
                            //Player 2 button +1
                            Button(action: {score.player2Score  = updateScore(playerScore: score.player2Score, scoreStep: +1)})
                            { Image("Button1TwoPlayer")
                                    .resizable()
                                    .player2ButtonStyle(with: "+1")
                            }
                        }//HStack
                        HStack(spacing: 30){
                            //Player 2 button -5
                            Button(action: {score.player2Score  = updateScore(playerScore: score.player2Score, scoreStep: -5)})
                            { Image("Button5TwoPlayer")
                                    .resizable()
                                    .player2ButtonStyle(with: "-5")
                            }
                            //Player 2 button +5
                            Button(action: {score.player2Score  = updateScore(playerScore: score.player2Score, scoreStep: +5)})
                            { Image("Button5TwoPlayer")
                                    .resizable()
                                    .player2ButtonStyle(with: "+5")
                            }
                        }//HStack
                }//VStack Player 2
                .padding(.bottom, 50)
                
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
        }// Navigation View
        .preventScreenSleep()
    }// body
} // Struct Player2View

struct Player2View_Previews: PreviewProvider {
    static var previews: some View {
        Player2View(score: score())
    }
}
