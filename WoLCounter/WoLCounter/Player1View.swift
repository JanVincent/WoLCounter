//
//  Player1View.swift
//  WoLCounter
//
//  Created by Janeta Paul Vincent Paul on 3/30/22.
//

import SwiftUI
import UIKit

struct PlayerView: View {
    @ObservedObject var score: score
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        NavigationView{
            VStack{
                //Player Controls
                Text("Player")
                    .playerTextStyle(with: 60)
                //Player Score
                Text("\(score.playerScore)")
                    .updateScoreTextStyle(with: 140)
                VStack{
                    HStack{
                        //Player buton -1
                        Button(action: {score.playerScore = updateScore(playerScore: score.playerScore, scoreStep: -1)})
                        { Image("Button1OnePlayer").overlay(Text("-1"))
                        }
                        //Player button +1
                        Button(action: {score.playerScore  = updateScore(playerScore: score.playerScore, scoreStep: +1)})
                        { Image("Button1OnePlayer").overlay(Text("+1"))
                        }
                    }//HStack
                    HStack{
                        //Player button -5
                        Button(action: {score.playerScore  = updateScore(playerScore: score.playerScore, scoreStep: -5)})
                        { Image("Button5OnePlayer").overlay(Text("-5"))
                        }
                        //Player button +5
                        Button(action: {score.playerScore  = updateScore(playerScore: score.playerScore, scoreStep: +5)})
                        { Image("Button5OnePlayer").overlay(Text("+5"))
                        }
                    }//HStack
                }// VStack Player
                
                
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
        }.preventScreenSleep()
    }
}



struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(score: score())
    }
}
