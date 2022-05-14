//
//  ColorCircleView.swift
//  TrafficLightsSwiftUI
//
//  Created by Aleksandr Kretov on 12.05.2022.
//

import SwiftUI

struct ColorCircleView: View {
    
    let color: Color
    let diameter = UIScreen.main.bounds.maxX / 3
    let opacity: Double
    
    var body: some View {
        ZStack {
            Circle()
                .padding(-4)
                .frame(width: diameter, height: diameter)
                .foregroundColor(color)
                .shadow(color: color, radius: opacity == 1 ? 12 : 0)
                .opacity(opacity)
//                .overlay(Circle()
//                    .trim(from: 0.53, to: 0.97)
//                    .stroke(Color.brown, lineWidth: 8))
            .animation(.easeInOut(duration: 0.4), value: opacity)
            
            Image("bulb")
                .resizable()
                .contrast(2)
                .brightness(0.7)
                .frame(width: diameter + 8, height: diameter + 8)
                .blendMode(.multiply)
                .overlay(Circle()
                    .trim(from: 0.53, to: 0.97)
                    .stroke(Color.brown, lineWidth: 16))
            
            Circle()
                .frame(width: diameter + 28, height: diameter + 28)
//                .padding(14)
                .overlay(Circle()
                    .trim(from: 0.53, to: 0.97)
                    .stroke(Color.black, lineWidth: 20))
                .foregroundColor(.clear)
                .shadow(color: .black, radius: 10)
                .opacity(1.0)
        }
    }
}

struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .red, opacity: 1.0)
        ColorCircleView(color: .red, opacity: 0.3)
    }
}
