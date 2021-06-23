//
//  ContentView.swift
//  Learn-SwiftUI-Weather-App
//
//  Created by Nicholas McGinnis on 6/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		ZStack{
			LinearGradient(gradient: Gradient(colors: [.blue, Color("lightblue")]),
						   startPoint: .topLeading,
						   endPoint: .bottomTrailing)
				.edgesIgnoringSafeArea(.all)
			VStack {
				Text("Cupertino, CA")
					.font(.system(size: 32, weight: .medium, design: .default))
					.foregroundColor(.white)
					.padding()
				VStack(spacing: 10) {
					Image(systemName: "cloud.sun.fill")
						.renderingMode(.original)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 180, height: 180, alignment: .center)
					Text("76°")
						.font(.system(size: 70, weight: .medium, design: .default))
						.foregroundColor(.white)
				}
				.padding(.bottom, 40)
				
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
