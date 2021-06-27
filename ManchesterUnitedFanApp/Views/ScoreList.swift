//
//  ScoreList.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 05/06/21.
//

import SwiftUI

struct ScoreList: View {
    
    @State var currentMinTime: Int = 0
    @State var currentSecTime: Int = 0
    
    @State var hideGoal = true
    @State var gameOver = false
    
    @State var currentUtdScore: Int = 0
    @State var currentVillaScore: Int = 0

    let sectimer = Timer.publish(every: 0, on: .main, in: .common).autoconnect()
    let mintimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        let binding = Binding<Int>(get: {
            self.currentUtdScore
        }, set: {
            self.currentUtdScore = $0
        })
        
        VStack {
            
            VStack {
                
                if !hideGoal {
                ZStack {
                    LottieView(name: "goal", loopMode: .playOnce)
                        .frame(width: 150, height: 80)
                    Text("GOOOAALLLLL !")
                        .foregroundColor(.red)
                        .font(.custom("Copperplate Bold", size: 20))
                        .offset(y: 30)
                }                                    
                }
                Text(gameOver ? "Game Ended" : "Live Fixtures")
                    .font(.custom("Copperplate Bold", size: 10))
                    .frame(width: 150, height: 10, alignment: .bottom)

                HStack {
                    Image("manutdlogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Text("\(currentUtdScore)")
                        .font(.custom("Copperplate Bold", size: 30))
                        .onReceive(mintimer) { input in
                            if self.currentMinTime == 20 || self.currentMinTime == 35 || self.currentMinTime == 60 || self.currentMinTime == 90 {
                                self.currentUtdScore = self.currentUtdScore + 1
                                self.hideGoal = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                    self.hideGoal = true
                                }

                                if self.currentMinTime == 90 {
                                    self.sectimer.upstream.connect().cancel()
                                    self.mintimer.upstream.connect().cancel()
                                    self.gameOver = true
                                }
                            }
                            return
                        }
                    Text("-")
                        .font(.custom("Copperplate Bold", size: 20))
                    Text("\(currentVillaScore)")
                        .font(.custom("Copperplate Bold", size: 30))
                    Spacer()
                    Image("astonvilla")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 150, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                if !gameOver {
                Text("\(currentMinTime) : \(currentSecTime)")
                    .font(.custom("Copperplate Bold", size: 10))
                    .onReceive(mintimer) { input in
                        self.currentMinTime = self.currentMinTime == 90 ? 90 : self.currentMinTime + 1
                    }
                    .onReceive(sectimer) { input in
                        self.currentSecTime = self.currentSecTime == 60 ? 0 : self.currentSecTime + 1
                    }
                }
            }
        }
    }
}

struct ScoreList_Previews: PreviewProvider {
    static var previews: some View {
        ScoreList()
    }
}
