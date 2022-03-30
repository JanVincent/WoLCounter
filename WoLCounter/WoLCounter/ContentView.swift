//
//  ContentView.swift
//  WoLCounter
//
//  Created by Janeta Paul Vincent Paul on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 1){
                Image("appName").padding()
                //Navigate to Single Player screen
                NavigationLink(destination:PlayerView(score: score()).navigationBarHidden(true))
                {Image("buttonPlayers").playerButtonStyle(with:"Player 1")
                }
                //Navigate to 2-Player mode
                NavigationLink(destination: Player2View(score: score()).navigationBarHidden(true)){
                    Image("buttonPlayers").playerButtonStyle(with: "Player 2")
                }
                //Navigate to 3-Player mode
                NavigationLink(destination: Player3View(score: score()).navigationBarHidden(true)){
                    Image("buttonPlayers").playerButtonStyle(with: "Player 3")
                }
                //Navigate to 4-Player mode
                NavigationLink(destination: Player4View(score: score()).navigationBarHidden(true)){
                    Image("buttonPlayers").playerButtonStyle(with: "Player 4")
                    }

                    //Link(destination: URL) {
                Image("appLogo").padding(.bottom, 90).padding(.top, 30)
                    //}
                Spacer()
                    
                }//main VStack
            .myBackground()
                              
        }//NavigationnView
        .navigationBarHidden(true)

        
    }// body
}// Struct ContentView



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
