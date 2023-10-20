//
//  WeatherButton.swift
//  AeroSense
//
//  Created by Viral Parmar on 20/10/23.
//

import SwiftUI

struct WeatherButton: View {
    var isNight: Bool
    
    var body: some View {
        Text("Change Day Time")
            .frame(width: 260, height:50)
            .foregroundColor(.white)
            .background(isNight ? .black : .blue)
            .font(.system(size: 20, weight:.bold, design:.default))
            .cornerRadius(10)
    }
}

#Preview {
    WeatherButton(isNight: false)
}
