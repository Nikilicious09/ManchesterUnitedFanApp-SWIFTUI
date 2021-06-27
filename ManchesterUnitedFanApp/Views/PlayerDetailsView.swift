//
//  PlayerDetails.swift
//  ManchesterUnitedFanApp
//
//  Created by Nikil Vinod on 06/06/21.
//

import SwiftUI

struct RadarChartGrid: Shape {
  let categories: Int
  let divisions: Int
  
  func path(in rect: CGRect) -> Path {
    let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)
    let stride = radius / CGFloat(divisions)
    var path = Path()
    
    for category in 1 ... categories {
      path.move(to: CGPoint(x: rect.midX, y: rect.midY))
      path.addLine(to: CGPoint(x: rect.midX + cos(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * radius,
                               y: rect.midY + sin(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * radius))
    }
    
    for step in 1 ... divisions {
      let rad = CGFloat(step) * stride
      path.move(to: CGPoint(x: rect.midX + cos(-.pi / 2) * rad,
                            y: rect.midY + sin(-.pi / 2) * rad))
      
      for category in 1 ... categories {
        path.addLine(to: CGPoint(x: rect.midX + cos(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * rad,
                                 y: rect.midY + sin(CGFloat(category) * 2 * .pi / CGFloat(categories) - .pi / 2) * rad))
      }
    }
    
    return path
  }
}

struct RadarChartPath: Shape {
  let data: [Double]
  
  func path(in rect: CGRect) -> Path {
    guard
      3 <= data.count,
      let minimum = data.min(),
      0 <= minimum,
      let maximum = data.max()
    else { return Path() }
    
    let radius = min(rect.maxX - rect.midX, rect.maxY - rect.midY)
    var path = Path()
    
    for (index, entry) in data.enumerated() {
      switch index {
        case 0:
          path.move(to: CGPoint(x: rect.midX + CGFloat(entry / maximum) * cos(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                                y: rect.midY + CGFloat(entry / maximum) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius))
          
        default:
          path.addLine(to: CGPoint(x: rect.midX + CGFloat(entry / maximum) * cos(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius,
                                   y: rect.midY + CGFloat(entry / maximum) * sin(CGFloat(index) * 2 * .pi / CGFloat(data.count) - .pi / 2) * radius))
      }
    }
    path.closeSubpath()
    return path
  }
}

struct RadarChart: View {
  var data: [Double]
  let gridColor: Color
  let dataColor: Color
  
  init(data: [Double], gridColor: Color = .gray, dataColor: Color = .blue) {
    self.data = data
    self.gridColor = gridColor
    self.dataColor = dataColor
  }
  
  var body: some View {
    ZStack {
      RadarChartGrid(categories: data.count, divisions: 5)
        .stroke(gridColor, lineWidth: 0.5)
      
      RadarChartPath(data: data)
        .fill(dataColor.opacity(0.3))
      
      RadarChartPath(data: data)
        .stroke(dataColor, lineWidth: 2.0)
    }
  }
}

struct PlayerDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var showPlayerDetails: Bool
    
    var body: some View {
        
        VStack {
            ScrollView(.vertical) {
                VStack {
                    Image("bruno")
                        .frame(width: .infinity, height: 300, alignment: .top)
                        .clipped()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(1.2)
                        .shadow(radius: 10)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
                    
                    
                    Text("Bruno \nFernandes")
                        .frame(width: getRect().width, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                        .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                        .font(.custom("Copperplate Bold", size: 40))
                        .foregroundColor(.white)
                        .padding(.vertical, -70)
                    
                    Spacer(minLength: 5)
                    
                    VStack {
                        
                        HStack {
                            Text("\n“")
                                .foregroundColor(.black)
                                .font(.custom("Copperplate Bold", size: 40))
                            
                            + Text("One player doesn’t change a team. A team changes when everyone pushes together for the same side.")
                                .font(.custom("Baskerville Bold", size: 18))
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, -140)
                        .frame(width: .infinity, height: 280, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30) {
                            
                            VStack {
                                Text("26")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 40))
                                
                                Text("Age")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 10))
                            }
                            
                            
                            VStack {
                                Text("26")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 40))
                                
                                Text("Goals")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 10))
                            }
                            
                            VStack {
                                Text("19")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 40))
                                
                                Text("Assists")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 10))
                            }
                            
                            VStack {
                                Text("51")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 40))
                                
                                Text("Appearances")
                                    .foregroundColor(.white)
                                    .font(.custom("Copperplate Bold", size: 10))
                            }

                            
                        }
                        .padding(.vertical, -150)
                        
                        
                        
                        RadarChart(data: [100,80,80,60,80,82])
                            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.vertical, -80)

                        
                        Spacer()
                        
                    }
                    .frame(width: getRect().width, height: 600, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(
                    Image("listbg")
                )
            }
        }
    }
}

extension PlayerDetailsView {
    
    func getRect() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
    
}
