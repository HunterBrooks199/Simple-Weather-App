//
//  ContentView.swift
//  WeatherApp
//
//  Created by Hunter Brooks on 2/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                cityNameView(cityName: "Frederick, CO")
                VStack(spacing: 10) {
                    currentDayWeatherView(imageName: isNight ? "moon.circle.fill" : "sunrise.fill", temp: 76)
                        
                }

                .padding(.bottom, 40)
                
                HStack {
                    dayOfWeekView(dayOfWeek: "TUE", temp: 49, imageName: "cloud.hail.fill")
                    
                    dayOfWeekView(dayOfWeek: "WED", temp: 51, imageName: "cloud.bolt.rain.fill")
                    
                    dayOfWeekView(dayOfWeek: "THU", temp: 53, imageName: isNight ? "moon.fill" : "cloud.sun.fill")
                    
                    dayOfWeekView(dayOfWeek: "FRI", temp: 41, imageName: "cloud.hail.fill")
                    
                    dayOfWeekView(dayOfWeek: "SAT", temp: 40, imageName: "cloud.snow.fill")
                    
                    
                    }
                Spacer()
                    .padding(.bottom)

                VStack {
                    
                    Button(action: {
                        isNight.toggle()
                    }, label: {
                        Text("Change Time of Day")
                            .foregroundColor(.black)
                            .bold()
                            .fontWeight(.heavy)
                            .font(.system(size: 23, weight: .medium))
                            .frame(width: 350, height: 80, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(15)
                     
        

                    })
                    Spacer()
                }

                
                        
                    }
                    
                }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





struct dayOfWeekView: View {
    var dayOfWeek: String
    var temp: Int
    var imageName: String
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
                .bold()
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
 
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .red, isNight ? .gray : .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct cityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .bold()
            .font(.system(size: 32, weight: .heavy, design: .default))
            .foregroundColor(.white)
    }
}

struct currentDayWeatherView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180, alignment: .center)
        Text("\(temp)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
        
    }
}

