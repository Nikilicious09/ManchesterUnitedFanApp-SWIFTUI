//
//  MainView.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 05/06/21.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedTab = "Home"
    @State var showMenu = false
    
    @State var showPlayerDetails = false

    var body: some View {

        ZStack{
                        
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                MenuView(selectedTab: $selectedTab)
            })
            
            ZStack{
                
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
                    .disabled(showMenu ? true : false)
                
                if showPlayerDetails {
                    PlayerDetailsView(showPlayerDetails: $showPlayerDetails)
                }
            }
            .scaleEffect(showMenu ? 0.75 : 1)
            .offset(x: showMenu ? getRect().width - 200 : 0)
            .ignoresSafeArea()
            .overlay(
            
                Button(action: {
                    withAnimation(.spring()){
                        showMenu.toggle()
                    }
                }, label: {
                    
                    VStack(spacing: 5){
                        
                        Capsule()
                            .fill(showMenu ? Color.white : Color.primary)
                            .frame(width: 20, height: 2)
                            .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                            .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                        
                        VStack(spacing: 5) {
                            
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: showMenu ? 20 : 15, height: 2)
                                .opacity(showMenu ? 0 : 1)
                            
                            Capsule()
                                .fill(showMenu ? Color.white : Color.primary)
                                .frame(width: showMenu ? 20 : 10, height: 2)
                                .offset(y: showMenu ? -6 : 0)
                        }
                        .rotationEffect(.init(degrees: showMenu ? 50 : 0))
                        
                    }
                    .contentShape(Rectangle())
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    
                })
                .padding()
                ,alignment: .topLeading
                
            )
            
        }
        .background(
            Image("whiteabstract")
                .resizable()
        )

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension MainView {
    
    func getRect() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
}
