//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Aleksandr Kretov on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPosition = 0

    var body: some View {
        ZStack {
            Color.black.opacity(0.9).ignoresSafeArea()
            VStack {
                trafiicLights
                Spacer()
                SwitchButtonView(label: currentPosition == 0 ? "START" : "NEXT",
                                 action: switchAction)
            }.padding(EdgeInsets(top: 32, leading: 0, bottom: 32, trailing: 0))
        }.preferredColorScheme(.dark)
    }
}

extension ContentView {
    private var trafiicLights: some View {
        VStack(spacing: 24) {
            ColorCircleView(color: .red,
                            opacity: currentPosition == 1 ? 1.0 : 0.3)
            ColorCircleView(color: .yellow,
                            opacity: currentPosition == 2 ? 1.0 : 0.3)
            ColorCircleView(color: .green,
                            opacity: currentPosition == 3 ? 1.0 : 0.3)
        }
    }

    private func switchAction() {
        currentPosition < 3 ? (currentPosition += 1) : (currentPosition = 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
