//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Aleksandr Kretov on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonTitle = "START"
    @State private var currentPosition = 0

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea().opacity(0.9)

            VStack(spacing: 32) {
                createCircleWith(diameter: 100, color: .red)
                    .opacity(currentPosition == 1 ? 1.0 : 0.3)
                    .shadow(color: .red,
                            radius: currentPosition == 1 ? 7 : 0)
                createCircleWith(diameter: 100, color: .yellow)
                    .opacity(currentPosition == 2 ? 1.0 : 0.3)
                    .shadow(color: .yellow,
                            radius: currentPosition == 2 ? 7 : 0)
                createCircleWith(diameter: 100, color: .green)
                    .opacity(currentPosition == 3 ? 1.0 : 0.3)
                    .shadow(color: .green,
                            radius: currentPosition == 3 ? 7 : 0)
                Spacer()
                Button(action: switchLight) {
                    Text(buttonTitle)
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .padding(16)
        }
    }
}

extension ContentView {
    private func createCircleWith(diameter: CGFloat, color: Color) -> some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
