//
//  ContentView.swift
//  dark-sky-app
//
//  Created by Ananya Nagireddy on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    //locationManager is an observable object that tracks changes made to it 
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    //populates weather with response if it exists
    @State var weather: Response?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView().task{
                        //attempt to populate variable weather, of type response, by calling get current weather which sents api request and decodes response 
                        do{
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        } catch {
                            print("Error getting weather: \(error)")
                        }
                    }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    OnboardingScreen().environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.733, saturation: 0.868, brightness: 0.434)).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
