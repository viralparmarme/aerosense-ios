//
//  ContentView.swift
//  AeroSense
//
//  Created by Viral Parmar on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight:Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Mumbai")
                MainWeatherStatusView(imageName: "cloud.sun.fill",
                                      temperature: 26)
                HStack (spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   ImageName: "cloud.sun.fill",
                                   temperature: 26)
                    WeatherDayView(dayOfWeek: "WED",
                                   ImageName: "sun.max.fill",
                                   temperature: 24)
                    WeatherDayView(dayOfWeek: "THU",
                                   ImageName: "wind.snow",
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: "FRI",
                                   ImageName: "sunset.fill",
                                   temperature: 27)
                    WeatherDayView(dayOfWeek: "SAT",
                                   ImageName: "snow",
                                   temperature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(isNight: isNight)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var ImageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)")
                .font(.system(size: 26, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black:.blue,
                                                   isNight ? Color("darker-gray") : Color("lighter-blue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size:32, weight:.medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("\(temperature)")
                .font(.system(size: 60, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
