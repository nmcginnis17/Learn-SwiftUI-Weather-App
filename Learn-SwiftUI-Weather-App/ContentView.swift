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
			LinearGradient(gradient: Gradient(colors: [.green, .blue]),
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
