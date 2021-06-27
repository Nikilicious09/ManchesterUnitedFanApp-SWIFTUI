//
//  PlayerCard.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 05/06/21.
//

import SwiftUI

struct PlayerCard: View {
  
    @Binding var showPlayerDetails: Bool

    let players = [
        PlayerDetails(playerFirstName: "Bruno", playerLastName: "Fernandes", playerImage: "bruno"),
        PlayerDetails(playerFirstName: "Harry", playerLastName: "Maguire", playerImage: "maguire"),
        PlayerDetails(playerFirstName: "David", playerLastName: "De Gea", playerImage: "degea")
    ]
    
    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(players) { result in
                        Button(action: {
                            showPlayerDetails = true
                        }, label: {
                        VStack {
                            Spacer()
                            Text(result.playerFirstName + "\n" + result.playerLastName)
                                .font(.custom("Copperplate Bold", size: 25))
                                .foregroundColor(.white)
                            Image(result.playerImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        })
                        .frame(width: getRect().width/1.75, height: getRect().height/2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(
                            Image("listbg")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        )
                        .cornerRadius(20)

                        }
                }
            }
        }
        .shadow(radius: 30)
    }
}

extension PlayerCard {
    
    func getRect() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
    
}
