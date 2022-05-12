//
//  Extensions.swift
//  TrafficLightsSwiftUI
//
//  Created by Aleksandr Kretov on 12.05.2022.
//

import SwiftUI


extension ContentView {
    
    func createCircleWith(diameter: CGFloat, color: Color) -> some View {
        Circle()
            .padding(-4)
            .frame(width: diameter, height: diameter)
            .foregroundColor(color)
            .overlay(Circle().trim(from: 0.53, to: 0.97)
                .stroke(Color.black.opacity(0.8), lineWidth: 8))
            
    }

    func switchLight() {
        if buttonTitle == "START" { buttonTitle = "NEXT" }
        currentPosition < 3 ? (currentPosition += 1) : (currentPosition = 1)
    }
}
