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
                    .opacity(currentPosition == 1 ? 1.0 : 0.5)
                createCircleWith(diameter: 100, color: .yellow)
                    .opacity(currentPosition == 2 ? 1.0 : 0.5)
                createCircleWith(diameter: 100, color: .green)
                    .opacity(currentPosition == 3 ? 1.0 : 0.5)
                Spacer()
                Button(action: switchSemaphore) {
                    Text(buttonTitle)
                        .foregroundColor(.white)
                        .font(.title).bold()
                }
                .tint(.blue)
                .shadow(color: .gray, radius: 5)
                .buttonStyle(.borderedProminent)
            }
            .padding(16)
        }
    }
}

extension ContentView {
    private func createCircleWith(diameter: CGFloat, color: Color) -> some View {
        Circle()
            .frame(width: diameter, height: diameter)
            .foregroundColor(color)
            .padding(-3)
            .shadow(color: color, radius: 7)
            .overlay(Circle().trim(from: 0.5, to: 1)
                .stroke(Color.black.opacity(0.8), lineWidth: 6))
    }

    func switchSemaphore() {
        if buttonTitle == "START" { buttonTitle = "NEXT" }
        currentPosition < 3 ? (currentPosition += 1) : (currentPosition = 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
