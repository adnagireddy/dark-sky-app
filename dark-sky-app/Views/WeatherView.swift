//
//  WeatherView.swift
//  dark-sky-app
//
//  Created by Ananya Nagireddy on 8/13/23.
//

import SwiftUI

struct WeatherView: View {
    var  weather: Response 
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name).bold().font(.title)
                    Text(
                        Date().formatted(.dateTime.month().day().hour().minute())).fontWeight(.light)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer() //floods the above frame to fit entire screen
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            
                            Image(systemName:"sun.max").font(.system(size:40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°").font(.system(size: 90)).fontWeight(.bold).padding()
                    }
                    
                    //creates a new frame between city name/date and the temperature dsiplay below
                    
                    //Spacer()
                    
                    //asyncimage: asyncronaly downloads and displays an image from a remote url - a.k.a does the work for you
                    Image("skyline").resizable().aspectRatio(contentMode: .fit).frame(width:360)
                    
                    Spacer()
                    
                    //Displaying detailed weather information:
                    
                    
                }.frame(maxWidth: .infinity)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //DETAILED INFO SECTION, the white bottom section
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather breakdown").bold().padding(.bottom)
                    
                    //min & max temp
                    HStack{
                        WeatherRow(logo:"thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo:"thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble() + "°"))
                    }
                    
                    //wind speed &
                    HStack{
                        WeatherRow(logo:"wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "mph"))
                        Spacer()
                        WeatherRow(logo:"humidity.fill", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom, 20)
                    .foregroundColor( Color(hue: 0.733, saturation: 0.868, brightness: 0.434))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft,.topRight])
                
            }
            
        }.edgesIgnoringSafeArea(.bottom)
         .background(Color(hue: 0.733, saturation: 0.868, brightness: 0.434))
         .preferredColorScheme(.dark)

    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
