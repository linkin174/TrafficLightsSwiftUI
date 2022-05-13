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
        Circle()
            .padding(-4)
            .frame(width: diameter, height: diameter)
            .foregroundColor(color)
            .shadow(color: color, radius: opacity == 1 ? 12 : 0)
            .opacity(opacity)
            .shadow(color: color, radius: opacity == 1 ? 12 : 0)
            .overlay(Circle()
                .trim(from: 0.53, to: 0.97)
                .stroke(Color.brown, lineWidth: 8))
            .animation(.easeInOut(duration: 0.4), value: opacity)
    }
}

struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .blue, opacity: 1.0)
    }
}
