//
//  ContentView.swift
//  Learn-SwiftUI-Weather-App
//
//  Created by Nicholas McGinnis on 6/22/21.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isNight = false
	
    var body: some View {
		ZStack{
			BackgroundView(isNight: $isNight)
			VStack {
				CityTextView(cityName: "Cupertino, CA")
				
				MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
									  temp: isNight ? 67 : 76)
				
				HStack(spacing: 30) {
					WeatherDayView(dayOfWeek: "Tue",
								 imageName: "cloud.bolt.fill",
								 temp: 74)
					
					WeatherDayView(dayOfWeek: "Wed",
								 imageName: "sun.max.fill",
								 temp: 82)
					
					WeatherDayView(dayOfWeek: "Thu",
								 imageName: "cloud.sun.fill",
								 temp: 79)
					
					WeatherDayView(dayOfWeek: "Fri",
								 imageName: "cloud.sun.rain.fill",
								 temp: 78)
					
					WeatherDayView(dayOfWeek: "Sat",
								 imageName: "cloud.sun.bolt.fill",
								 temp: 81)
				}
				Spacer()
				
				Button {
					isNight.toggle()
				} label: {
					WeatherButton(title: "Change Day Time",
								textColor: .blue,
								backgroundColor: .white)
				}
				
				Spacer()
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
	
	var dayOfWeek: String
	var imageName: String
	var temp: Int
	
	var body: some View {
		VStack {
			Text(dayOfWeek)
				.font(.system(size: 16, weight: .medium, design: .default))
				.foregroundColor(.white)
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 40, height: 40, alignment: .center)
			Text("\(temp)")
				.font(.system(size: 25, weight: .medium, design: .default))
				.foregroundColor(.white)
		}
	}
}

struct BackgroundView: View {
	
	@Binding var isNight: Bool
	
	var body: some View {
		LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
					   startPoint: .topLeading,
					   endPoint: .bottomTrailing)
			.edgesIgnoringSafeArea(.all)
	}
}

struct CityTextView: View {
	
	var cityName: String
	
	var body: some View {
		Text(cityName)
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundColor(.white)
			.padding()
	}
}

struct MainWeatherStatusView: View {
	
	var imageName: String
	var temp: Int
	
	var body: some View {
		VStack(spacing: 10) {
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 180, height: 180, alignment: .center)
			Text("\(temp)°")
				.font(.system(size: 70, weight: .medium, design: .default))
				.foregroundColor(.white)
		}
		.padding(.bottom, 40)
	}
}
