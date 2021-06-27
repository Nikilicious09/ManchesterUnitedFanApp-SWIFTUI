//
//  Home.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 04/06/21.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {
        
        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

struct Home: View {
    
    @Binding var selectedTab: String
    
    @State var showPlayerDetails = false
        
    var body: some View {
        ZStack {
                                    
            VStack(alignment: .center) {
                VStack {
                    VStack {
                        HStack {
                            // Left Button
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Image(systemName: "line.horizontal.3.decrease")
                                    .foregroundColor(.black)
                                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .opacity(0)
                            }
                            
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                            
                            // Logo Button
                            Button(action: {}) {
                                Image("manutdlogo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                            
                            // Profile Button
                            Button(action: {}) {
                                Image("profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(40/2)
                            }
                        }
                        .padding(.horizontal)
                        .frame(width: getRect().width, height: 60, alignment: .top)
                        
                        Spacer(minLength: 20)
                        
                        ScoreList()

                        Spacer()
                        
                        HStack {
                            
                            Spacer()
                            
                            PlayerCard(showPlayerDetails: $showPlayerDetails)
                        }
                        
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        
                    }
                    .padding(.vertical, 10)
                    .background(
                        RoundedCornersShape(corners: [.bottomLeft], radius: 40)
                            .fill(Color(.white))
                    )
                    .shadow(radius: 30)
                    
                }
                
                Spacer()
                
                HStack(alignment: .center) {
                }
                .statusBar(hidden: true)
                .frame(width: getRect().width, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
               
            }
            
            if showPlayerDetails {
                PlayerDetailsView(showPlayerDetails: $showPlayerDetails)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
            }

        }
        
    }
}


extension Home {
    
    func getRect() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
    
}

