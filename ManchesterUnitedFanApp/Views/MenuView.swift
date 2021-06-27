//
//  MenuView.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 05/06/21.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var selectedTab: String
    @Namespace var animation
        
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading, spacing: 30, content: {
                
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(70/2)
                    .padding(.top,80)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                    .shadow(radius: 30)

                VStack(alignment: .leading, spacing: 1, content: {
                    
                    Text("Nikilicious")
                        .font(.custom("Copperplate Bold", size: 20))
                        .foregroundColor(.white)
                    
                    Text("(Editor)")
                        .font(.custom("Copperplate Bold", size: 10))
                        .foregroundColor(.white)
                    
                })
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    MenuButtons(image: "home", title: "Home", selectedTab: $selectedTab, animation: animation)

                    MenuButtons(image: "Compose", title: "Groups", selectedTab: $selectedTab, animation: animation)

                })
                .padding(.leading,0)
                .padding(.top, 0)
                
            })
            .padding()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .topLeading)
            
        }
        .background(
            Image("whiteabstract")
                .resizable()
        )
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
