//
//  TabButton.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 05/06/21.
//

import SwiftUI

struct MenuButtons: View {
    
    var image: String
    var title: String
    
    @Binding var selectedTab: String
    
    var animation: Namespace.ID
    
    var body: some View {
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            
            HStack(spacing: 0) {
                            
                Text(title)
                    .font(.custom("Copperplate Bold", size: 14))
                
            }
            .foregroundColor(selectedTab == title ? .gray : .white)
            .frame(width: 150, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 12)
            .padding(.horizontal, -10)
            .background(
                Color.white
                    .opacity(selectedTab == title ? 1 : 0)
            )
            .cornerRadius(5)
            .shadow(radius: 30)
            
        })
    }
}

