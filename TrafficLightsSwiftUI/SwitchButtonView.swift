//
//  ButtonView.swift
//  TrafficLightsSwiftUI
//
//  Created by Aleksandr Kretov on 12.05.2022.
//

import SwiftUI

struct SwitchButtonView: View {
    
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 125, height: 60)
        .background(.blue)
        .cornerRadius(12)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButtonView(label: "START", action: {})
    }
}
