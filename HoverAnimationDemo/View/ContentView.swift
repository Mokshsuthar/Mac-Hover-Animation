//
//  ContentView.swift
//  HoverAnimationDemo
//
//  Created by Moksh on 20/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = ContentViewModel()
    
    @ViewBuilder
    var shineEffect : some View {
        Circle()
            .fill(Color.white)
            .frame(width: 130,height: 130)
            .blur(radius: 80)
            .position(model.hoverLocation)
            .opacity(model.isHovering ? 1 : 0)
    }
    
    var body: some View {
        ZStack{
            
            ZStack{
                shineEffect
                
                Image("pattern")
                    .resizable().aspectRatio(contentMode: .fill)
                    .foregroundStyle(Color.white)
                    .frame(width: 300,height: 350)
                    .mask{
                        shineEffect
                        
                    }
                
                
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.white,lineWidth: 10)
                    .mask{
                        shineEffect
                        
                    }
                
                VStack{
                    Image(systemName: "swift")
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 100,height: 100)
                        .offset(x: model.rotationY * 2,y: -model.rotationX * 2)
                        .shadow(color: Color.black.opacity(model.isHovering ? 0.4 : 0), radius: 12, x:  model.rotationY * 5, y: -model.rotationX * 5)
                    
//                    Text("\(model.hoverLocation)")
                }
               
                
                
            }
            .frame(width: 300,height: 350)
            .background(.ultraThinMaterial)
            .background(LinearGradient(colors: [Color.orange,Color.teal], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(50)
            .rotation3DEffect(.degrees(model.rotationY), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(model.rotationX), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .black.opacity(0.2), radius: 20, x:  -model.rotationY * 10, y: model.rotationX * 10)
            .onContinuousHover(perform: model.didHover(_:))
            
         
        }
        .frame(width: 500,height: 500,alignment: .center)
       
    }
}

#Preview {
    ContentView()
}
